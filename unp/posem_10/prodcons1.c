#include "unipc.h"
#define BUFF 10

#define SEM_MUTEX "mutex"
#define SEM_NEMPTY "nempty"
#define SEM_NSTORED "nstored"

int nitems = 20;
struct {
	int	buff[BUFF];
	sem_t	*nempty, *nstored, *mutex;
} shared;

void *prod(void *arg);
void *cons(void *arg);

int main(int argc, char **argv)
{
	if (argc > 1) nitems = atoi(argv[1]);	
	int	flags, code;
	pthread_t	tid_prod, tid_cons;
	flags = O_RDWR | O_CREAT | O_EXCL;
	shared.mutex   = sem_open(SEM_MUTEX, flags, FILE_MODE, 1);
	if (shared.mutex == SEM_FAILED) err_abort("sem_open sem_mutex failed");

	shared.nempty  = sem_open(SEM_NEMPTY, flags, FILE_MODE, BUFF);
	if (shared.nempty == SEM_FAILED) err_abort("sem_open nempty failed");

	shared.nstored = sem_open(SEM_NSTORED, flags, FILE_MODE, 0);
	if (shared.nstored == SEM_FAILED) err_abort("sem_open nstored failed");
	
	code = pthread_create(&tid_prod, NULL, prod, NULL);
	if (code != 0) errcode_abort(code ,"pthread_create failed");
	code = pthread_create(&tid_cons, NULL, cons, NULL);
	if (code != 0) errcode_abort(code ,"pthread_create failed");
	
	pthread_join(tid_prod, NULL);
	pthread_join(tid_cons, NULL);
	
	sem_unlink(SEM_MUTEX);
	sem_unlink(SEM_NEMPTY);
	sem_unlink(SEM_NSTORED);
	return 0;
}

void *prod(void *arg)
{
	int	i;
	for (i = 0; i < nitems; i++) {
		sem_wait(shared.nempty);
		sem_wait(shared.mutex);
		shared.buff[i % BUFF] = i;
		printf("set %d\n", i);
		sem_post(shared.mutex);
		sem_post(shared.nstored);		
	}
	return NULL;
}

void *cons(void *arg)
{
	int	i;
	for (i = 0; i < nitems; i++) {
		sem_wait(shared.nstored);
		sem_wait(shared.mutex);
		if (shared.buff[i % BUFF] != i)
			printf("%d = %d\n", i, shared.buff[i % BUFF]);
		sem_post(shared.mutex);
		sem_post(shared.nempty);
	}	
	return NULL;
}
