#include <iostream>

void foo(const char *word = "default");
int main()
{
	foo();
	foo("inputed");
}

void foo(const char *word)
{
	std::cout << word << "\n";
}
