#include <algorithm>
#include <functional>
#include <stdio.h>
#include <vector>
#include <iterator>
using namespace std;
int add(int x)
{
	return x + x;
}
int main(void)
{
	vector<int> v;
	v.push_back(1);
	v.push_back(3);
	v.push_back(7);
	v.push_back(9);
	vector<int> v1(v.size()); // must set size
	transform(v.begin(), v.end(), v1.begin(), add);
	
	vector<int>::iterator p;
	for(p = v1.begin(); p != v1.end(); p++) {
		printf("%d\t", (int)*p);
	}	
	return 0;
}
