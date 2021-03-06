#include "unp2.h"
int append(char *path, char *value);
int main(int argc, char **argv)
{
	if (argc != 3) usage("<path> <value>"); 
	append(argv[1], argv[2]);
	return 0;		
}

int append(char *path, char *value)
{
	int		fd;
	fd = open(path, O_RDWR | O_CREAT, 0644);
	if (fd < 0) err_abort("open failed");
	struct stat stat;
	fstat(fd, &stat);
	lseek(fd, stat.st_size, SEEK_SET); 
	write(fd, value, strlen(value));
	close(fd);
	return (0);	
}

