#pragma once
#include "salesEmployee.h"
#include "Manager.h"

class salesManager:public salesEmployee,public Manager{
	public:
		salesManager() = default;
		salesManager(const char*,int,int,int,int,int,int,int const,int);
		void display();
		int calSal();
		
};
