/*
	test bind2nd
*/
#include <algorithm>
#include <iostream>
#include <list>
#include <queue>
#include <functional>
#include <stdio.h>
using namespace std;
int main()
{
	list<int> q;
	q.push_back(2);
	q.push_back(4);	
	q.push_back(9);
	
	list<int>::const_iterator p = find_if(q.begin(), q.end(), bind2nd(less<int>(), 7));
	printf("%d\n", (int)*p);

	return 0;
}
