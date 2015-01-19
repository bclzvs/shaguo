#include <stdio.h>

int main()
{
	union {
		short	s;
		char	c[sizeof(short)];
	} un;
	un.s = 0x0102;
	if(un.c[0] == 1 && un.c[1] == 2)
		printf( "big");
	else
		printf( "small");
	return 0;
}
