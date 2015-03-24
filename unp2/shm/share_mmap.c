#include "unp2.h"
#define SEM_NAME "share_mmap_sem"

int main(int argc, char **argv)
{
	if (argc != 3) {
		fprintf(stderr, "usage:%s <loop> <filename>\n", argv[0]);
		return 1;
	}
	int		loop, i, fd;
	int		*ptr;
	int		zero = 0;
	sem_t	*mutex;
	loop = atoi(argv[1]);
	fd = open(argv[2], O_RDWR | O_CREAT, FILE_MODE);
	write(fd, &zero, sizeof(int));
	if (fd == -1) err_abort("open failed");

	ptr = mmap(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0); 
	if (ptr == MAP_FAILED) err_abort("mmap failed");
	close(fd);
	setbuf(stdout, NULL);
	mutex = sem_open(SEM_NAME, O_CREAT | O_EXCL, 0644, 1);
	sem_unlink(SEM_NAME);

	if (fork() == 0) {
		for (i = 0; i < loop; i++) {
			sem_wait(mutex);
			printf("child: count = %d\n",(*ptr)++);
			sem_post(mutex);
		}	
		_exit(0); // if not exit, it will execute until end;
	}	

	for (i = 0; i < loop; i++) {
		//(*ptr)++;
		sem_wait(mutex);
		printf("parent: count = %d\n",(*ptr)++);
		sem_post(mutex);
	}	
	return (0);
}

