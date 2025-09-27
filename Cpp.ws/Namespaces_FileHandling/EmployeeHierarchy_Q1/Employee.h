//class employee
#pragma once

#include<iostream>
#include"Date.h"
#include"String.h"

using namespace std;

class Employee
{
	private:
		String name;
		Date b_date; //object of class
		int emp_id;
		static int new_emp_id;
		
	public:
		Employee();
		Employee(const char*,int,int,int);
		virtual void display();
		virtual int calSal()=0; //Pure Virtual function,this is a concerning statement

};
