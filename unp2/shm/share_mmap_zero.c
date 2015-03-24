#include "unp2.h"

struct shared {
	int		count;
	sem_t	mutex;	
} shared;

int main(int argc, char **argv)
{
	if (argc != 2) {
		fprintf(stderr, "usage:%s <loop> \n", argv[0]);
		return 1;
	}
	int		loop, i, fd;
	sem_t	*mutex;
	struct shared *ptr;
	loop = atoi(argv[1]);
	fd = open("/dev/zero", O_RDWR);
	//write(fd, &shared, sizeof(shared));
	if (fd == -1) err_abort("open failed");

	ptr = mmap(NULL, sizeof(shared), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0); 
	if (ptr == MAP_FAILED) err_abort("mmap failed");
	close(fd);
	setbuf(stdout, NULL);
	sem_init(&ptr->mutex, 1, 1);

	if (fork() == 0) {
		for (i = 0; i < loop; i++) {
			sem_wait(&ptr->mutex);
			printf("child: count = %d\n",ptr->count++);
			sem_post(&ptr->mutex);
		}	
		_exit(0); // if not exit, it will execute until end;
	}	

	for (i = 0; i < loop; i++) {
		//(*ptr)++;
		sem_wait(&ptr->mutex);
		printf("parent: count = %d\n",ptr->count++);
		sem_post(&ptr->mutex);
	}	
	return (0);
}

