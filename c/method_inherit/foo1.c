#include "foo.h"
void foo1_init();
static void foo1()
{
	printf("foo1\n");
}

void foo1_init()
{
	bar = foo1; 
}
