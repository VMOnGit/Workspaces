#include "Manager.h"

Manager::Manager (const char*nm,int d,int m ,int y,int DA):Employee(nm,d,m,y){

	DailyAllow = DA;	
}

void Manager::display(){
	Employee::display();
	cout<<"Daily Allowance is: "<<DailyAllow<<endl;
}

void Manager::displayDA(){
	cout<<"Daily Allowance is: "<<DailyAllow<<endl;
}

int Manager::calSal(){
	return DailyAllow;
}

int Manager::Bonus(){
	return 1000;
}

