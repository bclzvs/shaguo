#include <iterator>
#include <vector>
#include <stdio.h>
#include <iostream>

using namespace std;
int main()
{
	//setbuf(stdout, NULL);
	printf("input i1:");
	istream_iterator<int> is(cin);
	int i1 = *is;

	printf("input i2:");
	++is;
	int i2 = *is;
	printf("i1=%d, i2=%d\n", i1, i2);	
	return 0;
}
