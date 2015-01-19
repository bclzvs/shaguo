
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
	if(argc < 2) {
		printf("usage:%s name", argv[0]);
		return 0;
	}
	if(sem_unlink(argv[1]) != 0)
		err_abort("sem_unlink failed");
	return 0;
}
