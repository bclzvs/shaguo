#include "date.h"
Date Date::default_date(1, 10, 1949);
Date::Date(int day, int month, int year)
{
	d = day > 0 ? day : default_date.d;
	m = month > 0 ? month : default_date.m;
	y = year > 0 ? year : default_date.y;	
}

