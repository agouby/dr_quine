#include <stdio.h>

void	do_nothing(void)
{
	int	true;

	true = 0;
	while (true)
		;
}

/*
 **  I will try to do something
*/

int	main(void)
{
	char	*print;
	do_nothing();
	/* I promise I tried :'(*/
	print = "#include <stdio.h>%c%cvoid%cdo_nothing(void)%c{%c%cint%ctrue;%c%c%ctrue = 0;%c%cwhile (true)%c%c%c;%c}%c%c/%c%c %c%c  I will try to do something%c%c/%c%cint%cmain(void)%c{%c%cchar%c%cprint;%c%cdo_nothing();%c%c/%c I promise I tried :'(%c/%c%cprint = %c%s%c;%c%cprintf(print, 10, 10, 9, 10, 10, 9, 9, 10, 10, 9, 10, 9, 10, 9, 9, 10, 10, 10, 42, 10, 42, 42, 10, 42, 10, 10, 9, 10, 10, 9, 9, 42, 10, 9, 10, 9, 42, 42, 10, 9, 34, print, 34, 10, 9, 10, 9, 10, 10);%c%creturn (0);%c}%c";
	printf(print, 10, 10, 9, 10, 10, 9, 9, 10, 10, 9, 10, 9, 10, 9, 9, 10, 10, 10, 42, 10, 42, 42, 10, 42, 10, 10, 9, 10, 10, 9, 9, 42, 10, 9, 10, 9, 42, 42, 10, 9, 34, print, 34, 10, 9, 10, 9, 10, 10);
	return (0);
}
