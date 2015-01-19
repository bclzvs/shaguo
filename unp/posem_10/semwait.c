
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>
#include <stdio.h>
#include <semaphore.h>
#include <fcntl.h>

#define FILE_MODE 0644
#define err_abort(msg) do {\
	fprintf(stderr, "%s:%s at %s:%d\n", \
		msg, strerror(errno), __FILE__, __LINE__);\
	_exit(1);\
	} while(0)

int main(int argc, char **argv)
{
	int	flags, val;
	sem_t	*sem;
	flags = O_RDWR;
	if (argc != 2) {
		printf("usage:%s <name>\n", argv[0]);
		return 0;
	}
	sem = sem_open(argv[1], flags);
	if (sem == SEM_FAILED)
		err_abort("sem_open failed");
	if (sem_wait(sem) != 0) 
		err_abort("sem_wait failed");
	if (sem_getvalue(sem, &val) != 0)	
		err_abort("sem_getvalue failed");
	printf("pid %ld has semaphore, value = %d\n",(long)getpid(), val);
	pause();
	return 0;
}
