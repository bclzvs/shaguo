#include <iterator>
#include <list>
#include <algorithm>
#include <iostream>

using namespace std;

int main(void)
{
	list<int> nums(1,2);
	list<int> numsOut;
	fill_n(front_inserter(nums), 3, 1);
	fill_n(back_inserter(nums), 3, 1);
	//fill_n(inserter(nums, numsOut), 3, 4);

	copy(nums.begin(), nums.end(), ostream_iterator<int>(cout));	
	//copy(numsOut.begin(),numsOut.end(), ostream_iterator<int>(cout));	
	
	return 0;
}
