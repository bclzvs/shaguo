#ifndef _date_h
#define _date_h		1
class Date
{
public:
	Date(int day = 0, int month = 0, int year = 0);
	int year() { return y;}
	int month() { return m;}
	int day() {return d;}
private:
	int d, m, y;
	static Date default_date;
};

// Date Date::default_date(1, 10, 1949); // cause lk error: multiple define
#endif
