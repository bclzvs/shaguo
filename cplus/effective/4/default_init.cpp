#include <string>
class Bar{
public:
	Bar() { x = 0;}
private:
	int x;
};
class Foo{
public:
	Foo(int x, Bar y):num(x),bar(y){}
	//Foo(int x, Bar y):num(x){ bar = y;}
private:
	int	num;
	Bar bar;
};

int main()
{
	Bar b;
	Foo foo(3,b);
	return 0;
}
