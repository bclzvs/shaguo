#include <stdio.h>
#include <locale.h>
#include <wchar.h>

int main(void)
{
	if(!setlocale(LC_CTYPE, "")) {
		fprintf(stderr, "Can't set the locale!");
		return 1;
	}
	wchar_t* c = L"你好\n";
	printf("%ls\n", c);
	printf("len:%d\n", wcslen(c));
	return 0;
}
