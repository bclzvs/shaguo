#include <stdio.h>

#define	VALUE 0xFFF8
int main()
{
	short int snum = VALUE;
	unsigned short int	unsum = VALUE;
	printf("signed:%d\n",(signed int)VALUE);
	printf("unsigned:%d\n",(unsigned int)VALUE);
}
