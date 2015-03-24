/*
	variable in memory 
	
	from: linux c 编程一站式学习 19.2
*/

#include <stdio.h>

const int gl_const_A = 10;
int gl_a = 20;
static int gl_static_b = 30;
int gl_no_init_c;

int main(void)
{
	static int local_static_a = 40;
	char b[] = "Hello world";
	register int register_c = 50;
	printf("Hello world%d\n", 0);
	return 0;
}
