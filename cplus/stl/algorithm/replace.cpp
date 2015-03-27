#include <algorithm>
#include <functional>
#include <stdio.h>
#include <vector>
#include <iostream>
#include <iterator>
#include <string.h>
using namespace std;
#define array_len(a) (sizeof(a) / sizeof(a[0]))

int main(void)
{
	char *s = "hlello";
	vector<char> v(s, s + strlen(s));
	vector<char>::iterator p = remove(v.begin(), v.end(), 'l');

	copy(v.begin(), v.end(), ostream_iterator<char>(cout));
	cout << "\n";
	copy(v.begin(), p, ostream_iterator<char>(cout));
	cout << "\n";
	v.assign(s, s + strlen(s));
	remove_copy(v.begin(), v.end(), ostream_iterator<char>(cout), 'l');	
	return 0;
}
