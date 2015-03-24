#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#define FILE_NAME "seqno"
#define FILE_MODE 0644
#define	BUFSIZE 4096
#define errabort(msg) do{\
	fprintf(stderr, "%s error:%s at %s:%d\n", \
		msg, strerror(errno), __FILE__, __LINE__);\
	_exit(1);\
	} while(0)
	
void lock(int fd);
void unlock(int fd);
int main(int argc, char *argv[])
{
	int		fd, i, n, no;
	char		buf[BUFSIZE];
	pid_t		pid;
	pid = getpid();	
	memset(buf, 0, sizeof(buf));
	fd = open(FILE_NAME, O_RDWR, FILE_MODE);
	if(fd < 0) errabort("open failed");

	for(i = 0; i < 20; i++) {
		lock(fd);
		lseek(fd, 0, SEEK_SET);
		n = read(fd, buf, sizeof(buf));
		buf[n] = '\0';
		n = sscanf(buf, "%d\n", &no);
		printf("%s:pid=%ld, no=%d\n",argv[0], (long)pid, no);
		
		no++;
		n = snprintf(buf, sizeof(buf), "%d\n", no);
		lseek(fd, 0, SEEK_SET);
		write(fd, buf, n  );
		unlock(fd);
	}	
	close(fd);
}
