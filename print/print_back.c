#include <unistd.h>
#include <stdio.h>

int main()
{
	printf("a");
	fflush(stdout);
	sleep(1);
	printf("b");
	fflush(stdout);
	
	sleep(1);
	printf("c");
	fflush(stdout);
	sleep(1);
	printf("d");
	fflush(stdout);
	sleep(1);
	printf("e");
	fflush(stdout);
	printf("\b\b\b\b\b");
	fflush(stdout);
	printf("     ");
	return 0;
}

