/*
	test derive from binder2nd
*/
#include <algorithm>
#include <iostream>
#include <list>
#include <queue>
#include <functional>
#include <stdio.h>
using namespace std;
// binder2nd<BinOp>
// binder2nd< less<T> > space is must
template<class T> struct less_than : public binder2nd< less<T> > {
	explicit less_than(const T& x) : binder2nd< less<T> >(less<T>(), x){}
};

int main()
{
	list<int> q;
	q.push_back(2);
	q.push_back(4);	
	q.push_back(9);
	
	list<int>::const_iterator p = find_if(q.begin(), q.end(), less_than<int>(7));
	printf("%d\n", (int)*p);

	return 0;
}
