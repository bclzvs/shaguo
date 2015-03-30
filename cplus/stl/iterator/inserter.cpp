#include <iterator>
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

int main(void)
{
	vector<int> nums(1,2);
	nums.push_back(3);
	nums.push_back(5);

	//vector<int> numsOut;
	//fill_n(front_inserter(nums), 3, 1);
	//fill_n(back_inserter(nums), 3, 1);
	//fill_n(inserter(nums, numsOut.begin()), 3, 4);
	
	fill_n(inserter(nums, nums.begin() + 1), 3, 4);

	copy(nums.begin(),nums.end(), ostream_iterator<int>(cout));	
	//copy(numsOut.begin(),numsOut.end(), ostream_iterator<int>(cout));	
	
	return 0;
}
