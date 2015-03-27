#include <vector>
#include <algorithm>
#include <functional>
#include <iostream>
#include <stdio.h>

using namespace std;

int main()
{
	vector<char> v;
	v.push_back('b');
	v.push_back('A');
	v.push_back('B');
	v.push_back('B');
	v.push_back('D');
	v.push_back('a');
	v.push_back('a');
	
	short num = count_if(v.begin(), v.end(), bind2nd( greater<char>(), 'C')); // result type could be short or other type
	//int num = count(v.begin(), v.end(), 'B'); // result is 2
	//count << num << "\n";
	printf("%d\n", num);
	return 0;
}

