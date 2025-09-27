#include "WageEmployee.h"

WageEmployee::WageEmployee(const char*nm,int d,int m,int y,int h,int r):
	Employee(nm,d,m,y)
{
	hours = h;
	rate =r;
	
}

void WageEmployee::display(){
	Employee::display();
	cout << "\nHours:"<<hours<<endl;
	cout<<"\nRate: "<<rate<<endl;
	cout<<"\nSalary: "<<calSal()<<endl;
}

int WageEmployee::calSal(){
	salary = hours*rate; 
	return (hours*rate);
}
