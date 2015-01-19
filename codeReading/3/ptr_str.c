#include <stdio.h>

int main()
{
	char	*pwd_file = "/etc/passwd";
	char	line[] = "/dev/XtyXX";
	printf("pwd_file size:%d\n", sizeof pwd_file);
	printf("line size:%d\n", sizeof(line));
	return 0;
}
