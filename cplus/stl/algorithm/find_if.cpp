/*
	test find_if
*/
#include <vector>
#include <iostream>
#include <algorithm>
#include <stdio.h>
using namespace std;

bool less_than_7(int num);

int main(void)
{
	int	nums[] = {14,25,2,5,7};
	vector<int> v(nums, &nums[sizeof(nums) - 1];
	//v.push_back(14);
	//v.push_back(25);
	//v.push_back(2);
	//v.push_back(5);
	vector<int>::const_iterator p = find_if(v.begin(), v.end(), less_than_7);
	printf("first value less than 7:%d\n", *p);
	//count >> (int)*p >> "\n";
	return 0;
}

bool less_than_7(int num)
{
	return num < 7;
}
