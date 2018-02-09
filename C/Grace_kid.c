#include<stdio.h>
#include<fcntl.h>
#define CREATE int fd=open("Grace_kid.c",O_RDWR|O_CREAT,0644)
/*Hello*/
#define STR char *str="#include<stdio.h>%1$c#include<fcntl.h>%1$c#define CREATE int fd=open(%2$cGrace_kid.c%2$c,O_RDWR|O_CREAT,0644)%1$c/*Hello*/%1$c#define STR char *str=%2$c%3$s%2$c%1$c#define HELLO int main(void){CREATE;if(fd==-1)return(-1);STR;dprintf(fd,str,10,34,str);return(0);}%1$cHELLO%1$c"
#define HELLO int main(void){CREATE;if(fd==-1)return(-1);STR;dprintf(fd,str,10,34,str);return(0);}
HELLO
