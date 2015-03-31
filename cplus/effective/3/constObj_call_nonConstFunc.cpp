/*
	test a const-object call a function of non-const
*/
class Foo{
public:
	void bar() { printf("non-const bar"); }
};

int main()
{
	const Foo foo;
	foo.bar();
	return 0;
}
