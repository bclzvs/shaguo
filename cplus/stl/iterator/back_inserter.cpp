#include <iterator>
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

int main(void)
{
	vector<int> nums(1,2);
	fill_n(back_inserter(nums), 3, 1);
	//fill_n(front_inserter(nums), 3, 1); // vector has no member push_front,so error occured;


	copy(nums.begin(), nums.end(), ostream_iterator<int>(cout));	
	
	return 0;
}
