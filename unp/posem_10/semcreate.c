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
	int	c;	
	int	flags, initVal;
	flags = O_RDWR | O_CREAT;

	while( (c = getopt(argc, argv, "ei:")) != -1) {
		switch(c) {
			case 'e':
				flags |= O_EXCL;
				break;
			case 'i':
				initVal = atoi(optarg);
				break;	
		}
	}	
	if(optind != argc -1){
		printf("usage:%s [-e] [-i:] name\n", argv[0]);
		return (1);
	}
	sem = sem_open(argv[optind], flags, FILE_MODE, initVal);
	if (sem == SEM_FAILED)
		err_abort("sem_open failed");
	if(sem_close(sem) != 0)
		err_abort("sem_close failed");
	return (0);
}
