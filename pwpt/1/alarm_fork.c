#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <wait.h>
#include "errors.h"

int main()
{
	int		status;
	int		seconds;
	pid_t	pid;
	char	line[128];
	char	message[64];

	while(1){
		printf("Alarm>");
		if(fgets(line, sizeof(line), stdin) == NULL) exit(0);

		if(strlen(line) <= 1) continue;

		if(sscanf(line, "%d %64[^\n]", &seconds, message) < 2) {
			fprintf(stderr, "Bad command\n");
		} else {
			pid = fork();
			if(pid == -1)
				errno_abort("fork");

			if(pid == 0) {
				/* in the child */
				sleep(seconds);
				printf("(%d) %s\n", seconds, message);
				exit(0);
			} else {
				/* in the parent */
				do {
					pid = waitpid(-1, NULL, WNOHANG);
					if( pid == -1)
						errno_abort("Wait for child");
				} while(pid != 0);
			}
		}
	}
}
