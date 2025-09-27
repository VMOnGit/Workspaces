#pragma once
#include "Employee.h"

class WageEmployee:public Employee{
	private:	
		int hours=0,rate=0;
	
	public:
		WageEmployee()=default;
		WageEmployee(const char*,int,int,int,int,int);
		void display();
};

