/*
 test a class with ref member
 compiler will not auto generate operator=, and error
*/
class Foo {
public:
	Foo(int& num):num(num) {};
private:
	int& num;
};

int main()
{
	int i = 0;
	Foo f1(i);
	Foo f2(i);
	f2 = f1;
}
