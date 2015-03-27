#include <algorithm>
#include <functional>
#include <stdio.h>
#include <vector>
#include <iostream>
#include <iterator>
#include <string.h>
using namespace std;
#define array_len(a) (sizeof(a) / sizeof(a[0]))

int main(void)
{
	int v1[5];
	int v2[5];
	fill(v1, &v1[5],3);	
	copy(v1, &v1[5], ostream_iterator<int>(cout));
	generate(v2, &v2[5], Randint());
	copy(v2, &v2[5], ostream_iterator<int>(cout));
	return 0;
}
