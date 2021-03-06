#ifndef _employee_h
#define _employee_h 1
class Employee
{
public:
	enum EmployType { E, M};
	Employee(char *first_name, char *last_name);
	void print() const;
private:
	char *first_name, *last_name;
	EmployType type;
};
#endif
