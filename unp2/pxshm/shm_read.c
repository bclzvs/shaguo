#include "unp2.h"

int main(int argc, char **argv)
{
	int		fd, i = 0;
	char	*ptr;
	struct stat	stat;
	
	
	if (argc != 2) usage("<name>");

	fd = shm_open(argv[1], O_RDONLY, 0);
	if (fd < 0) err_abort("shm_open failed");

	if (fstat(fd, &stat) == -1) err_abort("fstat error");

	ptr = mmap(NULL, stat.st_size, PROT_READ, MAP_SHARED, fd, 0);
	
	while (i++ < stat.st_size) {
		printf("%d", *ptr++);
	}	
	printf("\n");
}

