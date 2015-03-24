/*
	test copy ? when insert or push_back()
*/
#include <vector>
#include <stdio.h>
using namespace std;

struct Num {
	int no;
	Num(int i) : no(i){};
};

int main(void)
{
	Num i(1);	
	vector<Num> v;
	v.push_back(i); // copy
	i.no = 20;	
	printf("v no = %d\n", ((Num)v.back()).no); // result is 1
	printf("i no = %d\n", i.no);
	return 0;
}
