#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>
#include <string.h>
typedef struct sockaddr * SA;
void str_cli(FILE *fp, int sockfd);
int main(int argc, char *argv[])
{
	if(argc < 2) {
		printf("usage: %s servaddr\n", argv[0]);
		return 0;
	}

	int	sockfd;
	struct sockaddr_in servaddr;
	sockfd = socket(AF_INET, SOCK_STREAM, 0);

	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(9877);
	if(inet_pton(AF_INET, argv[1], &servaddr.sin_addr) != 1){
		printf("invalid address:%s", argv[1]);
		return -1;
	}
	printf("connecting server\n");
	if(connect(sockfd, (SA)&servaddr, sizeof(servaddr)) != 0) {
		printf("connect error:%s\n", strerror(errno));
		return -1;
	}
	printf("connected\n");
	str_cli(stdin, sockfd);
	exit(0);	
}

void str_cli(FILE *fp, int sockfd)
{
	char sendline[1024], recvline[1024];
	int	n;
	while(fgets(sendline, sizeof(sendline), fp) != NULL) {
		write(sockfd, sendline, strlen(sendline));
		if( (n = read(sockfd, recvline, sizeof(recvline))) > 0)			
			fputs(recvline, stdout);
		else if(n == 0) {
			printf("str_cli:server terminated;\n");
			exit(-1);
		}
	}
}
