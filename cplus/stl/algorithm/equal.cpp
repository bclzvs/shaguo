#include <vector>
#include <functional>
#include <algorithm>
#include <stdio.h>
using namespace std;

int main(void)
{
	vector<int> v;
	v.push_back(1);
	v.push_back(2);

	vector<int> v1 = v;
	
	bool e = equal(v.begin(),v.end(), v1.begin()); // 
	printf("v equals v2: %d\n" ,e); // true

	v1.insert(v1.begin(),2); // insert
	e = equal(v.begin(),v.end(), &v1[1]); // true
	printf("v equals v2: %d\n" ,e);
	
	return 0;
}
