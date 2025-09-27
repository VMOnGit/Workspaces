#include "Date.h"
int main()
{
	Date d1;
	Date d2;
	Date d3;
	d1.accept();
	d1.display();
	d1.setNewYear(d1.getYear());
	d1.setYear(2015);
	d1.display();
	d1.setYear(Date::getNewYear());
	d1.display();


	 
	
	return 0;
}
