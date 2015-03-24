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
	sem_t	*sem;
	int	val;
	sem = sem_open(argv[1], 0);
	if (sem == SEM_FAILED)
		err_abort("sem_open failed");
	if (sem_post(sem) != 0)
		err_abort("sem_post failed");
	
	if (sem_getvalue(sem, &val) != 0)	
		err_abort("sem_getvalue failed");
	printf("value = %d\n", val);
	return 0;
}
