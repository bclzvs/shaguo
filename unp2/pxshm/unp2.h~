#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <semaphore.h>
#define FILE_MODE 0644
#define err_abort(msg) do {\
	fprintf(stderr, "%s:%s at %s:%d\n",\
		msg, strerror(errno), __FILE__, __LINE__);\
		_exit(1);\
	} while(0)

#define usage(help) do {\
	fprintf(stderr, "usage:%s %s\n", \
		argv[0], help);\
		_exit(1);\
	} while(0)
