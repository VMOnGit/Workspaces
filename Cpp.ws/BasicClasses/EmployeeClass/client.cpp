#include "Employee.h"
int main()
{
	Emp d1;
	Emp d2;

	d1.accept();
	d1.display();
	cout<<"Your Emp ID is:"<<Emp::getNewEid()<<endl;
	
	d2.accept();
	d2.display();
	char n[20] = "Sidh";
	d2.setName(n);
	d2.display();
	
	return 0;
}
