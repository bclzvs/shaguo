#include <iostream>
#include <vector>
#include <iterator>
using namespace std;

int main()
{
	ostream_iterator<int> os(cout);
	*os = 2;	
	++os;
	*os = 3;
	return 0;
}
