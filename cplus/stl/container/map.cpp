/*
	test map
*/
#include <map>
#include <iostream>
#include <string>
using namespace std;

void readitems(map<string, int> &);
int main()
{
	map<string, int> m;
	readitems(m);
	int total = 0;
	map<string,int>::const_iterator it;

	for(it = m.begin(); it != m.end(); it++) {
		total += it->second;
		cout << it->first << "\t" << it->second << "\n";	
	}		
	
	cout << "total-----------" << total << "\n";
	return 0;
}


void readitems(map<string, int> &m)
{
	string key;
	int	num = 0;
	while(cin >> key >> num)
		m[key] += num;	

}
