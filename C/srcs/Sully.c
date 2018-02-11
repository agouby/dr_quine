#include<stdio.h>
#include<fcntl.h>
#include<stdlib.h>
#include<string.h>
#define OPEN char buf[1024];sprintf(buf,"Sully_%d.c",i);int fd=open(buf,O_RDWR|O_CREAT,0644);if(fd==-1)return(-1)
#define COMPILE char buf2[1024];sprintf(buf2,"gcc -Wall -Werror -Wextra -o %2$.*1$s %2$s",(int)strlen(buf)-2,buf);system(buf2)
#define COPY char *str="#include<stdio.h>%1$c#include<fcntl.h>%1$c#include<stdlib.h>%1$c#include<string.h>%1$c#define OPEN char buf[1024];sprintf(buf,%2$cSully_%%d.c%2$c,i);int fd=open(buf,O_RDWR|O_CREAT,0644);if(fd==-1)return(-1)%1$c#define COMPILE char buf2[1024];sprintf(buf2,%2$cgcc -Wall -Werror -Wextra -o %%2$.*1$s %%2$s%2$c,(int)strlen(buf)-2,buf);system(buf2)%1$c#define COPY char *str=%2$c%3$s%2$c%1$c#define EXECUTE sprintf(buf2,%2$c./%%.*s%2$c,(int)strlen(buf)-2,buf);system(buf2)%1$c#define MAIN(X) int main(void){int i=X;if(X<=0)return(0);OPEN;--i;COPY;dprintf(fd,str,10,34,str,i);COMPILE;EXECUTE;return(0);}%1$cMAIN(%4$d)%1$c"
#define EXECUTE sprintf(buf2,"./%.*s",(int)strlen(buf)-2,buf);system(buf2)
#define MAIN(X) int main(void){int i=X;if(X<=0)return(0);OPEN;--i;COPY;dprintf(fd,str,10,34,str,i);COMPILE;EXECUTE;return(0);}
MAIN(5)
