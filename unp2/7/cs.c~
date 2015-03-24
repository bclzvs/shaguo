#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#define min(x,y) (x < y ? x : y)
#define MAXITEMS 1000000
#define MAXTHREADS 100

void *produce(void *arg);
void *consume(void *arg);

struct {
	pthread_mutex_t		mutex;
	int					buf[MAXITEMS];
	int					nput;
	int					nval;
	int					nitems;
} shared = {
	PTHREAD_MUTEX_DEFAULT
};

int main(int argc, char *argv[])
{
	int		i, errcode, nitems, nthread, count[MAXTHREADS];
	pthread_t	threads[MAXTHREADS], consume_thread;

	if (argc < 2) {
		printf("usage:%s items, threads\n", argv[0]);
		return 0;
	}

	nitems  = min(atoi(argv[1]), MAXITEMS);
	nthread = min(atoi(argv[2]), MAXTHREADS);
	shared.nitems = nitems;
	for (i = 0; i < nthread; i++) {
		count[i] = 0;
		errcode = pthread_create(&threads[i], NULL, produce, (void *)&count[i]);	
		if ( errcode != 0) {
			printf("pthread_create:%s\n", strerror(errno));
			abort();
		}
	}	

	for (i = 0; i < nthread; i++) {
		pthread_join(threads[i], NULL);
		printf("count[%d] = %d\n", i, count[i]);
	}

	pthread_create(&consume_thread, NULL, consume, NULL);
	pthread_join(consume_thread, NULL);
	sleep(1000);
	return 0;
}

void *produce(void *arg)
{
	for(;;) {
		pthread_mutex_lock(&shared.mutex);
		if (shared.nput > shared.nitems) {
			pthread_mutex_unlock(&shared.mutex);
			return;
		}
		shared.buf[shared.nput++] = shared.nval++;
		//shared.nput++;
		//shared.nval++;
		pthread_mutex_unlock(&shared.mutex);
		*(int *)arg += 1;
	}	
}

void *consume(void *arg)
{
	int i;
	for (i = 0; i < shared.nitems; i++) {
		if (shared.buf[i] != i) {
			printf("buf[%d] = %d\n", i, shared.buf[i]);
		}
	}
}
