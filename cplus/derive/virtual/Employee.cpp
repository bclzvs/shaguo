#include <iostream>
#include "Employee.h"

Employee::Employee(char *first_name, char *last_name)
	:first_name(first_name), last_name(last_name) 
	,type(E)
{

}

void Employee::print() const
{
	std::cout << first_name << " " << last_name << "\n";
	std::cout << "type:" << type << "\n";
}
