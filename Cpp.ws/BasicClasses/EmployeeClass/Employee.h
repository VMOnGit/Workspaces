#include<iostream>
using namespace std;

class Emp
{
	int eid=1,salary=1;
	char name[20];
	static int new_eid;
	public:
		
		
	Emp(); //user-defined
	Emp(char[],int);
	void display();
	void accept();
	
	char* getName();
	void setName(char[]);
	
	void setSalary(int);
	int getSalary();
	
	int getEid();
	
	void setNewEid();
	static int getNewEid();
	
};
