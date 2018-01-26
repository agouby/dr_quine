#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main()
{
	int	i;
	char	buf[4096];
	char	buf2[4096];
	int	fd;

	i = 5;
	if (i == 0)
		return (0);
	sprintf(buf, "Sully_%d.c", i);
	if ((fd = open(buf, O_RDWR | O_CREAT, 0666)) == -1)
		return (-1);
	i--;
	char *str = "#include <stdio.h>%c#include <stdlib.h>%c#include <fcntl.h>%c#include <unistd.h>%c#include <string.h>%c%cint main()%c{%c%cint i;%c%cchar buf[4096];%c%cchar buf2[4096];%c%cint fd;%c%c%ci = %d;%c%cif (i == 0)%c%c%creturn (0);%c%csprintf(buf,%cSully_%%d.c%c, i);%c%cif ((fd = open(buf, O_RDWR | O_CREAT, 0666)) == -1)%c%c%creturn (-1);%c%ci--;%c%cchar *str = %c%s%c;%c%cdprintf(fd,str,10,10,10,10,10,10,10,10,9,10,9,10,9,10,9,10,10,9,i,10,9,10,9,9,10,9,34,34,10,9,10,9,9,10,9,10,9,34,str,34,10,9,10,9,10,9,34,34,10,9,10,9,34,34,10,9,10,9,10);%c%cclose(fd);%c%csprintf(buf2, %cclang -Wall -Werror -Wextra -o %%.*s %%s%c, (int)strlen(buf) - 2, buf, buf);%c%csystem(buf2);%c%csprintf(buf2, %c./%%.*s%c, (int)strlen(buf) - 2, buf);%c%csystem(buf2);%c%creturn (0);%c}";
	dprintf(fd,str,10,10,10,10,10,10,10,10,9,10,9,10,9,10,9,10,10,9,i,10,9,10,9,9,10,9,34,34,10,9,10,9,9,10,9,10,9,34,str,34,10,9,10,9,10,9,34,34,10,9,10,9,34,34,10,9,10,9,10);
	close(fd);
	sprintf(buf2, "clang -Wall -Werror -Wextra -o %.*s %s", (int)strlen(buf) - 2, buf, buf);
	system(buf2);
	sprintf(buf2, "./%.*s", (int)strlen(buf) - 2, buf);
	system(buf2);
	return (0);
}
