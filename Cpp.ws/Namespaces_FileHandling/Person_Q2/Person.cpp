#include "Person.h"

Person::Person(){
	int length = 0;
	name = new char[length+1];
	*name = '\0';
}

Person::Person(char *nm,char *pid, int a){
	int length = strlen(nm);
	name = new char[length+1];
	strcpy(name,nm);
	length = strlen(pid);
	pan_id = new char[length+1];
	strcpy(pan_id,pid);
	age = a;
}

void Person::accept(){
	char temp_name[20],temp_pan[20];
	cout<<"Enter Name,pan_id,Age :"<<endl;
	
	cin>>temp_name>>temp_pan>>this->age;
	
	int length = strlen(temp_name);	//DMA For String
	name = new char[length+1];
	strcpy(name,temp_name);
	length = strlen(temp_pan);
	pan_id = new char[length+1];
	strcpy(pan_id,temp_pan);
	
}
void Person::display(){
	cout<<"Name: "<<name<<endl<<"Pan ID"<<pan_id<<endl<<"Age"<<age<<endl;
		
	
}

Person::~Person(){
	if(name)
		delete []name;
	
	name=NULL;
	if(pan_id)
		delete []pan_id;
		
	pan_id = NULL;
}
