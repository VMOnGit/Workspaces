#pragma once
#include "WageEmployee.h"

class salesEmployee:public WageEmployee{
	private:
		int sales=0;
		int const commission=0;
		
	public:
		public:
		salesEmployee()=default;
		salesEmployee(const char*,int,int,int,int,int,int,int const);
		void display();

};
