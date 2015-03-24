#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <string.h>
#include <signal.h>
#include <errno.h>
typedef int Sigfunc(int);
static void str_echo(int clifd);
static ssize_t readline(int fd, void *vptr, size_t maxlen);
Sigfunc *Signal(int signo, Sigfunc *sigfunc);
void sig_chld(int signo);
int main(int arg, char *argv[])
{
	int	listenfd, connfd;
	pid_t	childpid;
	socklen_t chilen;
	char	buff[128];
	struct sockaddr_in cliaddr, servaddr;
	if( (listenfd = socket(AF_INET,SOCK_STREAM, 0) ) < 0)
		printf("socket error");
	memset(&servaddr, 0, sizeof(listenfd));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port = htons(9877);
	bind(listenfd, (struct sockaddr*)&servaddr, sizeof(servaddr));
	listen(listenfd, 1);
	Signal(SIGCHLD, sig_chld);
	for(;;){
		printf("waiting connection\n");
		if((connfd = accept(listenfd, (struct sockaddr *)&cliaddr,&chilen)) == -1){
			if(errno == EINTR) {
				continue;
			}
			printf("accept error:%s",strerror(errno));
			return -1;
		}
		printf("connection from %s port %d\n",
			inet_ntop(AF_INET, &cliaddr.sin_addr, buff, sizeof(buff)),
			ntohs(cliaddr.sin_port));
		if( (childpid = fork()) == 0){
			close(listenfd);
			str_echo(connfd);
			exit(0);
		}
		close(connfd);
		printf("closed\n");
	}
			
}

void str_echo(int sockfd)
{
	ssize_t	n;
	char	buf[1024];
again:
	while ( (n = readline(sockfd, buf, sizeof(buf))) > 0){
		write(sockfd, buf, n);
	}
	if(n < 0 && errno == EINTR)
		goto again;
	else if (n < 0)
		printf("error str_echo");
}

static ssize_t readline(int fd, void *vptr, size_t maxlen)
{
	ssize_t	n, rc;
	char	c, *ptr;
	ptr = vptr;
	for(n = 1; n < maxlen; n++) {
		if ( (rc = read(fd, &c, 1)) == 1) {
			*ptr++ = c;
			if(c == '\n')
				break;
		} else if (rc == 0) {
			*ptr = 0;
			return (n - 1);
		} else {
			if( errno == EINTR){
				continue;
			} else {
				printf("error occur");
				return -1;
			}
		}
	}
	*ptr = '\0';
	return n;
}
Sigfunc *Signal(int signo, Sigfunc *func)
{
	struct sigaction act, oact;
	act.sa_handler = func;
	sigemptyset(&act.sa_mask);
	act.sa_flags = 0;
	if (signo == SIGALRM) {
#ifdef SA_INTERRUPT
		act.sa_flags |= SA_INTERRUPT;
#endif
	} else {
#ifdef SA_RESTART
		act.sa_flags != SA_RESTART;	
#endif
	}
	if (sigaction(signo, &act, &oact) < 0)
		return(SIG_ERR);
	return  oact.sa_handler;	

}

void sig_chld(int signo)
{
	pid_t	pid;
	int	stat;
	pid = wait(&stat);
	printf("child %d terminated\n", pid);
	return;
}
