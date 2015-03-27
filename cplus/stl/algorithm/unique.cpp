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
	int nums[] = {1,3,5,5,5, 7, 7,9};
	vector<int> v(nums, &nums[array_len(nums)]);			
	vector<int>::iterator first_repeat = unique(v.begin(), v.end());
	printf("%d\n",*first_repeat);
	copy(v.begin(), first_repeat, ostream_iterator<int>(cout));	
	printf("\n");
	v.assign(nums, &nums[array_len(nums)]);
	copy(v.begin(), v.end(), ostream_iterator<int>(cout));	
	printf("\n");
	unique_copy(v.begin(), v.end(), ostream_iterator<int>(cout));	
	return 0;
}
