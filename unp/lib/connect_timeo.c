#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>

#define err_abort(msg ) do {\
	fprintf(stderr, "%s error:%s at %s:%d\n", msg, strerror(errno),\
		__FILE__, __LINE__);\
	_exit(1);\
	} while(0)

typedef void *SigFunc(int);

struct sigaction *Signal(int signum, SigFunc handler)
{
	struct sigaction act, *oldact;
	sigset_t	sigset;
	sigemptyset(&sigset);
	act.sa_handler = handler;
	act.sa_mask = sigset;
	
	if (sigaction(signum, &act, oldact) == -1)
		err_abort("sigaction failed");

	return oldact;	
} 

void *connect_alarm(int sig)
{
	return;
}

int connect_timeo(int fd, const struct sockaddr *addr, socklen_t socklen)
{
	struct sigaction	*oldact;
	int		n;
	oldact = Signal(SIGALRM, connect_alarm);
	alarm(5);
	if ((n = connect(fd, addr, socklen)) < 0) {
		if (errno == EINTR)
			errno = ETIME;
	} else {
		alarm(0);
		
	}
	Signal(SIGALRM, oldact->sa_handler);
	return n;
}

int main(int argc, char **argv)
{
	
}
