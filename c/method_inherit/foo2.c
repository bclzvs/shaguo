#include "foo.h"
void foo2_init();
static void foo2()
{
	printf("foo2\n");
}
void foo2_init()
{
	bar = foo2; 
}
