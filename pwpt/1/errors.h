#include <stdio.h>
#include <string.h>
#include <errno.h>

#define errno_abort(msg) do{\
	fprintf(stderr, "error %s:%s\n", msg, strerror(errno));\
	exit(1);} \
	while(0)

#define err_abort(status, msg) do{\
	fprintf(stderr, "error %s:%d\n", msg, status);\
	exit(1);} \
	while(0)
