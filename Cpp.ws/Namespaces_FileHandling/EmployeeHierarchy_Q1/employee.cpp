//employee def
#include"Employee.h"
 int Employee::new_emp_id = 100;
 
Employee::Employee()
{
	//emp_id=0;
}

Employee::Employee(const char *nm,int d,int m,int y ):b_date(d,m,y),name(nm)
{
	//emp_id=eid;
	emp_id = ++new_emp_id;
}

void Employee::display()
{
	cout<<"Emp_ID:"<<emp_id<<endl;
	name.display();
	b_date.display();
	
}
