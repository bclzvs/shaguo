#include <stdlib.h>
#include <string.h>
#include <errno.h>

#ifndef DEBUG
#define DPRINT(arg) 
#else
#define DPRINT(arg) printf(arg)

#define errno_abort(msg) do { \
	fprintf(stderr, "%s at %d:%d, %s\n",\
		msg, __FILE__, __LINE__, strerror(errno));\
	abort(1);\
	} while(0)

#define err_abort(code, msg) do { \
	fprintf(stderr, "%s at %d:%d, %s\n",\
		msg, __FILE__, __LINE__, strerror(code));\
	abort(1);\
	} while(0)
