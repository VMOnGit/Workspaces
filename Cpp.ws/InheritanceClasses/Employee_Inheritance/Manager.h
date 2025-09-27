#pragma once
#include "Employee.h"

class Manager:public Employee{
	private:
		int DailyAllow = 0;
	public:
		Manager() = default;
		Manager (const char*,int,int,int,int);
		void display();
		void displayDA();
};
