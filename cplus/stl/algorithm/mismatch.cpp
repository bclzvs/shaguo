#include <vector>
#include <stdio.h>
using namespace std;

int main()
{
	typedef vector<char>::const_iterator CI;
	vector<char> v;
	v.push_back('H');	
	v.push_back('e');	
	v.push_back('l');	
	v.push_back('l');	

	vector<char> v1(v);
	pair<CI,CI> p = mismatch(v.begin(), v.end(), v1.begin());
	if(p.first != v.end())
		printf("%c,%c\n", *p.first, *p.second);
	else
		printf("matched\n");
	v1[2] = 'L';
	p = mismatch(v.begin(), v.end(), v1.begin());
	if(p.first != v.end())
		printf("%c,%c\n", *p.first, *p.second);
	else
		printf("matched\n");
	return 0;
}
