#include <iostream>
#include <vector>
#include <algorithm>

int main()
{
	std::vector<int> num;
	int e;

	while(std::cin >> e)
		num.push_back(e);

	std::sort(num.begin(), num.end());
	
	for(int i = 0; i < num.size(); i++)
		std::cout << num[i] << "\n";

	
	return 0;
}
