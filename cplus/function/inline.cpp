/*
test inline function
*/
#include <stdio.h>
inline int max(int x, int y)
{
	printf("x=%d, y=%d\n", x, y);
	return x > y ? x : y;
}
void foo();
int main()
{
	int i = 10;
	int j = 20;
	printf("max = %d\n", max(i,j));	
	foo();
}

void foo()
{
	int i = 10;
	int j = 20;
	printf("max = %d\n", max(i,j));	
}
