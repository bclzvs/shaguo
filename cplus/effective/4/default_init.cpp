class Foo{
public:
	Foo(int x):num(x){ }
private:
	int	num;
};

int main()
{
	Foo foo(3);
	return 0;
}
