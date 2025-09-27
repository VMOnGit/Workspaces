
 #include "Date.h"
 int Date::new_year = 2025;
 /*Date::Date()
 {
 	cout<<"\nDefault constructor invoked...";
 	day=1;
 	month=1;
 	year=2025;
 }*/
 
 Date::Date(int d,int m,int y)
 {	
 	cout<<"\nParametrized Constructor Invoked:";
 	day=d;
 	month=m;
 	year=y;
 }


 void Date::display()
 {
 	cout<<"\nDate::"<<day<<"/"<<month<<"/"<<year<<std::endl;
 }
  void Date::staticDisplay()
 {
 	cout<<"\nDate::"<<day<<"/"<<month<<"/"<<new_year<<std::endl;
 }
 
 void Date::accept()
 {
	cout<<"\nEnter date:: ";
	cin>>day>>month>>year;
}

int Date::getYear()
{	
	return this->year;
}
void Date::setYear(int y)
{	
	this->year=y;
}
int Date::getNewYear()
{	
	return new_year;
}
void Date::setNewYear(int y)
{	
	new_year=y;
}
