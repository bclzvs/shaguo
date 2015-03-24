class Empty {
public:
	Empty() {}
	Empty(const Empty &rhs) {}
	~Empty() {}
	Empty& operator=(const Empty& rhs) {}
};

int main()
{
	Empty e;
	Empty e2(e);
	e2 = e;
	return 0;
}
