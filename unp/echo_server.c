#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <errno.h>
typedef struct socketaddr SA;
static void do(int sockfd);
int main()
{
	int	servfd, clifd;
	char	buf[256];
	socklen_t clilen;
	sockaddr_in servaddr, cliaddr;
	
	if( (servfd = socket(AF_INET, SOCK_STREAM)) < 0){
		printf("socket error:%s",strerror(errno));
		return -1;
	}
	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.in_addr = htonl(0);
	servaddr.sin_port = htons(3456);
	bind(servfd, (SA)&servaddr, sizeof(servaddr));
	listen(servfd, 5);
	for(;;){
		printf("waiting connection\n");
		clifd = accept(AF_INET, (SA)&cliaddr, &clilen);
		printf("connection from %s:%d\n", 
			inet_ntop(AF_INET,cliaddr.sin_addr.in_addr),
			ntohs(cliaddr.sin_port)
		);
		do(clifd);
		close(clifd);
	}	
}

void do(int sockfd)
{

}
