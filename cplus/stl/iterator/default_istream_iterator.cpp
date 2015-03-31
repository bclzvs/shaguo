#include <iterator>
#include <vector>
#include <iostream>
using namespace std;

int main()
{
	vector<int> v;
	copy(istream_iterator<int>(cin),
		 istream_iterator<int>(), // end input, ex: Ctrl+D
		 back_inserter(v));
	
	copy(v.begin(), v.end(), ostream_iterator<int>(cout));

	return 0;
}
