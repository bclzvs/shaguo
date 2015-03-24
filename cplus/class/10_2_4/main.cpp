#include <stdio.h>
#include "date.h"
int main()
{
	Date date;
	printf("%d-%d-%d\n", date.year(), date.month(), date.day());
}
