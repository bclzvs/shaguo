/* test struct with int sub num */
#include <stdio.h>

struct foo {
	int		value;
	char	*name;
};
typedef struct foo *foo_t;
#define FOO_DEFAULT ((foo_t)-1)
static foo_t s_foo = FOO_DEFAULT;

int main()
{
	//foo_t foo = {};	
	
	//printf("%d\n", foo.value);
	printf("%d\n", s_foo->value);
//	if(foo >= FOO3)
//		printf("great\n");
}

