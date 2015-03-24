#include "Employee.h"
#include "Manager.h"
#include <iostream>

Manager::Manager(char *first_name, char *last_name, int level)
				:Employee(first_name, last_name), level(level)
{
}

void Manager::print() const
{
	Employee::print();
	std::cout <<"level:" << level; 
}
