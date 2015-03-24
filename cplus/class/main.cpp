#include "date.h"
#include <stdio.h>
#include <stdlib.h>

int main()
{
	Date date = Date(11, 5, 2015);
	char	*dateStr = date.to_str();
	printf("date:%s\n", dateStr);	
	free(dateStr);

	// test copy
	Date d2 = date;
	d2.add_day(1).add_month(2);
	printf("d2:%s\n", d2.to_str());	
}
