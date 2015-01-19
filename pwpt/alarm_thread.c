#include <pthread.h>
#include <unistd.h>
#include "errors.h"

typedef struct alarm_s {
	pthread_mutex_t		mutex;
	int			seconds;
	char			message[64];
	struct alarms_s		*link;
} alarm_t;

void *alarm_thread(void *arg)
{
	return 0;
}

int main()
{
	pthread_t	thread;
	
}
