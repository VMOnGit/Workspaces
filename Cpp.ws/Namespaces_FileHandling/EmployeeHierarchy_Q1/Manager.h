#pragma once
#include "Employee.h"

class Manager:virtual public Employee{
	private:
		int DailyAllow = 0;
	public:
		Manager() = default;
		Manager (const char*,int,int,int,int);
		void display();
		void displayDA();
		int calSal();
		int Bonus();
};
