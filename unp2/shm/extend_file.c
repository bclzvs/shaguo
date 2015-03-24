#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/stat.h>

int main(int argc, char **argv)
{
	int		fd;
	struct stat stat;
	fd = open(argv[1], O_RDWR | O_CREAT, 0644);
	int		size = atoi(argv[2]);
	if (fd < 0) {
		perror("open failed");
		return 1;
	}	
	if(fstat(fd, &stat) == -1){
		perror("fstat failed");
		return 1;
	}
	lseek(fd, stat.st_size + size - 1, SEEK_SET);
	write(fd, "", 1); 		
}
