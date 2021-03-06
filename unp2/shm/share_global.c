#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>

int count;

int main(int argc, char **argv)
{
	if (argc == 1) {
		printf("usage:%s <loop>", argv[0]);
		return 0;
	}
	int		loop, i;
	loop = atoi(argv[1]);
	setbuf(stdout, NULL);

	if (fork() == 0) {
		for (i = 0; i < loop; i++) {
			printf("child: count = %d\n", count++);
		}	
		_exit(0);
	}	

	for (i = 0; i < loop; i++) {
		printf("parent: count = %d\n", count++);
	}	
	return (0);
}

