#include <stdio.h>
#include <vector>
#include <functional>
#include <algorithm>
using namespace std;

int main(void)
{
	int	nums[] = {1,3,5,7,9};
	vector<int> v(nums, &nums[sizeof(nums) -1]);
	//vector<int> v1(&v[2], v.end()); // error, v[] return a reference not a pointer
	vector<int> v1(v.begin() + 2, v.end());

	vector<int>::iterator p = search(v.begin(), v.end(), v1.begin(), v1.end());
	v1.insert(v1.begin(), 10);
	printf("%d\n", (int)*p);
	p = search(v.begin(), v.end(), v1.begin(), v1.end());
	printf("%d\n", (int)*p); // result is 0;
	return 0;
}
