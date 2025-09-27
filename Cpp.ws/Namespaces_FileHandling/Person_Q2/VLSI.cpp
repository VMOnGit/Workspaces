#include "VLSI.h"

DVLSI::DVLSI(char *nm,char *pid, int a, double PN, char *co,char *mod1, char *mod2):
Student(nm,pid,a,PN,co)
{
	int length = strlen(mod1);
	module1 = new char[length+1];
	strcpy(module1,mod1);
	length = strlen(mod2);
	module2 = new char[length+1];
	strcpy(module2,mod2);
}

void DVLSI::display(){
	Student::display();
	cout<<"Module 1 is: "<<module1<<endl<<"Module 2 is: "<<module2<<endl;
}

void DVLSI::accept(){
	char temp_mod1[10],temp_mod2[10];
	Student::accept();
	cout<<"Enter Module 1 and Module 2"<<endl;
	cin>>temp_mod1>>temp_mod2;
	
	int length = strlen(temp_mod1);
	module1 = new char[length+1];
	strcpy(module1,temp_mod1);
	length = strlen(temp_mod2);
	module2 = new char[length+1];
	strcpy(module2,temp_mod2);
	
}

DVLSI::~DVLSI(){
	if(module1)
		delete []module1;
		
	module1 = NULL;
	if(module2)
		delete []module2;
		
	module2 = NULL;
}

