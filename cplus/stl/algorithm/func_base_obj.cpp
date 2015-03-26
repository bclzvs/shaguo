/*
	test base function object
*/
#include <algorithm>
#include <functional>
#include <list>
#include <iostream>
#include <stdio.h>
using namespace std;
template<class T> class less_than : public unary_function<T,bool>
{
	T arg2;
public:
	explicit less_than(const T& x) : arg2(x){}
	bool operator()(const T& x) { return x < arg2;}	
};

int main(void)
{
	int	nums[] = {29,4,10,4,28,34,20};
	list<int> l(nums, &nums[sizeof(nums) - 1]);
	
	list<int>::iterator p = find_if(l.begin(), l.end(), less_than<int>(7));
	printf("first element less than 7 is %d\n", *p);
	return 0;
}
