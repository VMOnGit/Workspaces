
 #include "Employee.h"
 #include<string.h>
 int Emp::new_eid = 100;
 Emp::Emp()
 {
 	cout<<"\nDefault constructor invoked...";
 	eid=0;
 	salary=0;
 	strcpy(name,"\0");
 }
 
 Emp::Emp(char n[20],int sal)
 {	
 	cout<<"\nParametrized Constructor Invoked:";
 	strcpy(name,n);
 	salary=sal;
 	Emp::setNewEid();
 }


 void Emp::display()
 {
 	cout<<"\nEmp::"<<new_eid<<"/"<<name<<"/"<<salary<<std::endl;
 }
 
 void Emp::accept()
 {
	cout<<"\nEnter Name, Salary:: ";
	cin>>name>>salary;
	Emp::setNewEid();
}

int Emp::getEid()
{	
	return this->eid=new_eid;
}

 	
void Emp::setSalary(int sal){
	this->salary = sal;
}
int Emp::getSalary(){
	return this->salary;
}


void Emp::setNewEid()
{	
	new_eid++;
	this->eid = new_eid;
}
int Emp::getNewEid(){
	return new_eid;
}


char* Emp::getName(){
	return this->name;
}
void Emp::setName(char n[20]){
	strcpy(this->name,n);
}
