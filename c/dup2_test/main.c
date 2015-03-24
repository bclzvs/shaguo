#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <fcntl.h>

int main()
{
	// reset std_out to file
	int		fd;
	fd = open("std", O_WRONLY | O_CREAT, 0644);
	printf("before dup2\n");
	dup2(fd, STDOUT_FILENO);
	printf("after dup2\n");
	return 0;
}
