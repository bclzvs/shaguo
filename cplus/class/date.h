class Date {
	int	d, m, y;
public:
	Date(int day = 0, int month =0, int year = 0);
	Date& add_day(int day);
	Date& add_month(int month);
	Date& add_year(int year);
	char *to_str();
};

