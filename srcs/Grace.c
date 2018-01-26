#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define STR	"#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c#define STR%c%c%s%c%c#define OF%copen(%cGrace_kid.c%c,O_RDWR|O_CREAT,0666)%c/%cI am coding this while having a migraine%c/%c#define MIGRAINE int main(void){int fd=OF;if(fd==-1)return(-1);char*str=STR;dprintf(fd,str,10,10,10,9,34,str,34,10,9,34,34,10,42,42,10,10,10);close(fd);return(0);}%cMIGRAINE%c"
#define OF	open("Grace_kid.c",O_RDWR|O_CREAT,0666)
/*I am coding this while having a migraine*/
#define MIGRAINE int main(void){int fd=OF;if(fd==-1)return(-1);char*str=STR;dprintf(fd,str,10,10,10,9,34,str,34,10,9,34,34,10,42,42,10,10,10);close(fd);return(0);}
MIGRAINE
