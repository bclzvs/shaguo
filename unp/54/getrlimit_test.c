#include <stdio.h>
#include <sys/resource.h>
#include <sys/time.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
int main()
{
	struct rlimit limit;
	if( getrlimit(RLIMIT_NOFILE, &limit) == -1) {
		printf("getrlimit error:%s\n", strerror(errno));
	}
	printf("max fd number:%d\n", limit.rlim_cur);
}
