#include <algorithm>
#include <functional>
#include <stdio.h>
#include <vector>
#include <iostream>
#include <iterator>
using namespace std;
#define array_len(a) (sizeof(a) / sizeof(a[0]))

int main(void)
{
	int nums[] = {1,3,5,7,9};
	vector<int> v(nums, &nums[array_len(nums) - 1]);
	printf("v size %d\n", v.size());
	vector<int> v1(1, 11);	 // insert a element which value is 11
	printf("v1 size %d, max size:%d, capacity:%d\n", v1.size(), v1.max_size(), v1.capacity());
	copy(v.begin(), v.end(), v1.begin());	// will replace v1[0] value(11)	
	printf("after copyied v1 size %d\n", v1.size());

	vector<int>::iterator p;
	//v1.reserve(10); // reserver don't change size
	v1.resize(10); // change size;
	for (p = v1.begin(); p != v1.end(); p++) {
		printf("%d\t", *p);
	}
	v1[2] = 13;	
	printf("\nv1 size %d, max size:%d, capacity:%d\n", v1.size(), v1.max_size(), v1.capacity());
	copy(v.begin(), v.end(), v1.begin());	// will replace v[2] value
	printf("reserve size then copyied, v1 size %d\n", v1.size());

	printf("size %d\n", v1.size());
	for (p = v1.begin(); p != v1.end(); p++) {
		printf("%d\t", *p);
	}	
	
	copy(v.begin(), v.end(), ostream_iterator<int>(cout));	// will replace v[2] value
	return 0;
}
