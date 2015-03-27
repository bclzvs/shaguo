#include <algorithm>
#include <functional>
#include <stdio.h>
#include <vector>
using namespace std;
#define array_len(a) (sizeof(a) / sizeof(a[0]))

int main(void)
{
	int nums[] = {1,3,5,7,9};
	vector<int> v(nums, &nums[array_len(nums) - 1]);
	printf("v size %d\n", v.size());
	vector<int> v1(1, 11);	 // insert a element which value is 11
	//copy(v.begin(), v.end(), v1.begin());	
	printf("v1 size %d, max size:%d, capacity:%d\n", v1.size(), v1.max_size(), v1.capacity());
	copy(v.begin(), v.end(), back_inserter(v1));	

	vector<int>::iterator p;
	printf("size %d\n", v1.size());
	for (p = v1.begin(); p != v1.end(); p++) {
		printf("%d\t", *p);
	}	

	return 0;
}
