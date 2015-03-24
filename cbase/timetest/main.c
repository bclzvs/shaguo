#include <sys/time.h>
#include <stdio.h>

int main()
{
	struct timeval tv;
	gettimeofday(&tv, NULL);

	printf("seconds:%d\n", tv.tv_sec);
	printf("usec:%d\n", tv.tv_usec);
}
