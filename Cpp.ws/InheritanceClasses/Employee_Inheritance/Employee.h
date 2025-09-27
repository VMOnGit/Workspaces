//class employee
#pragma once
#include"Date.h"
#include<iostream>
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
		void display();

};
