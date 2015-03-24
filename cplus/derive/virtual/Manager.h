#ifndef _Manager_h
#define _Manager_h 1
#include "Employee.h"
class Manager : public Employee
{
public:
	Manager(char *first_name, char *last_name, int level);
	void print() const;

private:
	int	level;
};
#endif
