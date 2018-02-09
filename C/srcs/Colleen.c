#include <stdio.h>
void	foo(void){return ;}/*Hello*/int main(void){/*Do nothing*/char *str = "#include <stdio.h>%1$cvoid%2$cfoo(void){return ;}/*Hello*/int main(void){/*Do nothing*/char *str = %3$c%4$s%3$c;foo();printf(str, 10, 9, 34, str);return (0);}%1$c";foo();printf(str, 10, 9, 34, str);return (0);}
