#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define ONE_YEAR_SECONDS 365*24*60*60
char *reverse(const char *s);

int main()
{
	char *r = reverse("a");		
	printf("%s\n", r);
	printf("one year seconds:%d\n", ONE_YEAR_SECONDS);
	return 0;
}

char *reverse(const char *s)
{
	if(s == NULL) return NULL;
	size_t len = strlen(s);
	if(len == 0) return "";
	char *ret = malloc(len + 1);
	const char *sp = s + len -1;
	char *rp = ret;
	if(ret == NULL){
		printf("malloc error");
		exit(1);
	}
	while(sp >= s){
		*rp++ = *sp--;
	}

	*rp = '\0';	
	return ret;
}

