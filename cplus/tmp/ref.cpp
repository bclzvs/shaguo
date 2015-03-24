/*
  study reference
*/
#include <stdio.h>
int main()
{
	int	i = 0;
	int	&j = i;
	j++;
	printf("i=%d\n", i);	// result i 1	
	printf("i pointer=%p, j pointer=%p\n", &i, &j);
	// int	&ri = 1; // error, because 1 is temp, and ref is not const, so ri could change, but this is a temp var;
	const int &cri = 1; // const ref int, because it is const, so couldn't change	
	return (0);
}
