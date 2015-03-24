#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <semaphore.h>
#include <pthread.h>

#define err_abort(msg) do {\
	fprintf(stderr, "%s:%s at %s:%d\n", \
		msg, strerror(errno), __FILE__, __LINE__);\
	_exit(1);\
	} while(0)

#define errcode_abort(code, msg) do {\
	fprintf(stderr, "%s:%s at %s:%d\n", \
		msg, strerror(code), __FILE__, __LINE__);\
	_exit(1);\
	} while(0)

#define msg_abort(msg) do {\
	fprintf(stderr, "%s", \
		msg);\
	_exit(0);\
	} while(0)

#define FILE_MODE 0644
