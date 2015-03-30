#include <stdio.h>

void foo()
{
#define FOO_NUM	1
	return;
}

int main()
{
	printf("%d\n", FOO_NUM);
	return 0;
}
