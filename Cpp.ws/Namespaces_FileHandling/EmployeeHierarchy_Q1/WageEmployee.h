#pragma once
#include "Employee.h"

class WageEmployee:virtual public Employee{
	private:	
		int hours=0,rate=0,salary = 0;
	
	public:
		WageEmployee()=default;
		WageEmployee(const char*,int,int,int,int,int);
		void display();
		int calSal();
};

