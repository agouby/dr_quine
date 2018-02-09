#include <stdio.h>
#include <fcntl.h>

int main(void)
{
	char	buf[4096];

	sprintf(buf, "Sully_%d.c", 1);
	int fd = open(buf, O_RDWR|O_CREAT, 0644);
	return (0);
}
