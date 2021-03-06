/*
	container , vector
	from: c++ programming language 16.3
*/
#include <vector>
#include <stdio.h>

template<class C> typename C::value_type sum(const C& container)
{
	typename C::value_type s = 0;
	typename C::const_iterator p = container.begin();
	while(p != container.end()){
		s += *p;
		++p;
	}
	return s;
}
int main()
{
	using namespace std;
	vector<int> nums(10, 20);

	//nums.put(2);
	int s = sum(nums);
	printf("sum = %d\n", s);
	return 0;
}
