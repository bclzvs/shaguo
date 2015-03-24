#include "unp2.h"

int main(int argc, char **argv)
{
	int		fd, i = 0;
	struct stat	stat;
	char	*ptr;	
	if (argc != 2) usage("<name>");

	fd = shm_open(argv[1], O_RDWR, FILE_MODE);
	if (fd < 0) err_abort("shm_open failed");

	if (fstat(fd, &stat) == -1) err_abort("fstat failed");
	printf("fd size:%d\n", stat.st_size);

	ptr = mmap(NULL, stat.st_size,PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (ptr == MAP_FAILED) err_abort("mmap failed");

	while (i < stat.st_size) {
		*ptr++ = i++ % 256;		
	}	
	
}
