#include <stdio.h>
#include <stdlib.h>

class CTextBlock
{
public:
	explicit CTextBlock(char *str) : textBlock(str){}
	char& operator[](size_t position) const { return textBlock[position];}
	char* textBlock;	
};

int main()
{
	//const CTextBlock text("Hello");  // error, couln't set constant "hello" to char*
	char s[] = {'H', 'e', 'l', 'l', 'o'};
	const CTextBlock text(s);
	char *p = &text[1];
	*p = 'i';
	printf("%s\n", text.textBlock);
}
