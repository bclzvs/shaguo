#include <stdio.h>
int foo()
{
	static int bar = 10;
	bar++;
	return bar;
}
int main()
{
	foo();
	foo();
	printf("%d\n", foo()); 
}
