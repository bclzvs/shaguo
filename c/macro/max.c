#include <stdio.h>
/*
#define max(x,y)	do{\
				return x > y ? x : y; \
			} while(0)
*/
#define max(x,y) ((x) > (y) ? (x) : (y))
int main()
{
	int num = max(10+1,2);
	printf("max is %d\n",num );

	if(1)
		num = max(20,30);
	else
		num = 1;
	printf("max is %d\n", num);

	return 0;
}
