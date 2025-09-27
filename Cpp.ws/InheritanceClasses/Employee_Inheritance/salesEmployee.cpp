#include "salesEmployee.h"

salesEmployee::salesEmployee(const char*nm,int d,int m,int y,int h,int r,int s,int com):
	WageEmployee(nm,d,m,y,h,r),commission(com)
{
	sales = s;
	//commission = com;
}

void salesEmployee::display(){
	Employee::display();
	WageEmployee::display();
	cout << "\nSales: "<<sales<<endl;
	cout<<"\nCommission: "<<commission<<endl;
}
