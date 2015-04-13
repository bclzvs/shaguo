#include <stdio.h>
class Foo
{
public:
	~Foo(){ printf("~foo\n"); }
};
class FooError{};
void func()
{
	throw FooError(); 
}
int main()
{
	Foo foo;
	func();
	{
		//Foo* foo1 = new Foo();
		//int i = 1 / 0;
		//return 0;
		//delete foo1;
	}
	return 1;
}
