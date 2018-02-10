#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#define OPEN(X) char buf[1024];sprintf(buf, "Sully_%d.c", X);int fd=open(buf,O_RDWR|O_CREAT,0644);if(fd==-1)return(-1)
#define COMPILE char buf2[1024];sprintf(buf2, "gcc -Wall -Werror -Wextra -o %2$.*1$s %2$s", (int)strlen(buf)-2,buf);system(buf2)
int main(void)
{
	int i=5;
	OPEN(i);
	i--;
	if(i==0)
		return(0);
	COMPILE;
	return (0);
}
