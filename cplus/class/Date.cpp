#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "date.h"

Date::Date(int day, int month, int year)
{
	d = day;
	m = month;
	y = year;
}

Date& Date::add_day(int day)
{
	d += day;
	return *this;
}

Date& Date::add_month(int month)
{
	m += month;
	return *this;
}

Date& Date::add_year(int year)
{
	y += year;
	return *this;
}

char *Date::to_str()
{
	char *buffer = (char *)malloc(sizeof(char) * 11);
	snprintf(buffer, 11, "%d-%d-%d", y, m, d);	
	return buffer;
}
