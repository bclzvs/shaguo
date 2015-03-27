/*
	for_each
*/
#include <algorithm>
#include <vector>
#include <functional>
#include <stdio.h>
using namespace std;

// this is OK: class PrinNum : unary_function<int,void> {
// ok too
class PrinNum {
public:
	void operator()(const int &i)const { printf("%d\t", i);}
};

void print_num(const int& i);
int main()
{
	vector<int> v;
	v.push_back(1);
	v.push_back(2);

	//for_each(v.begin(), v.end(), ptr_fun(print_num)); // ok
	//for_each(v.begin(), v.end(),PrinNum()); // ok
	for_each(v.begin(), v.end(),print_num); // ok
	return 0;
}

void print_num(const int& i)
{
	printf("%d\t", i);
}
