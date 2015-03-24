#include <iostream>
#include <stdio.h>
#include <stdarg.h>

int compute(const char type...);
int main()
{
	int sum = compute('+', 1,2,3);
	printf("sum is %d\n", sum);
	return 0;	
}

int compute(const char type...)
{
	va_list	ap;
	int		ret = 0;
	va_start(ap, type);
	switch (type) {
		case '+':
			for(;;) {
				int	i = va_arg(ap, int);
				if (i == 0) break;	
				ret += i;
			}	
		break;
		default :
			ret = -1;
			printf("not support %c\n", type);
			break;
	}	
	va_end(ap);
	return ret;
}
