/*
	input string, and revert, then output
*/
#include <vector>
#include <iostream>
#include <stdio.h>

using namespace std;
int main()
{
	vector<char> v;
	char c;
	while( cin >> c){
		v.push_back(c);
	}	 		

	vector<char> rv(v.rbegin(), v.rend()); // reversed vector;
	vector<char>::iterator it = rv.begin();	

	for(; it != rv.end(); it++){
		printf("%c", (char)*it);
	}

	printf("\n");
	return 0;
}
