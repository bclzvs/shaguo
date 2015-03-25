/*
	constructor
*/
#include <vector>
#include <stdio.h>
#include <iostream>
using namespace std;
int main(void)
{
	char p[] = "Hello"; // size is 6
	vector<char> v(p, &p[sizeof(p) - 1]); // the last p is '\0'
	
	cout << "vector size:" << v.size() << "\n";	
	vector<char>::iterator it;
	for(it = v.begin(); it != v.end(); it++) {
		cout << *it;
	}
	return 0;
}
