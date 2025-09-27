#include "Student.h"

Student::Student(char *nm,char *pid, int a, double PN, char *co):Person(nm,pid,a){
	PRN = PN;
	int length = strlen(co);
	course = new char[length+1];
	strcpy(course, co);
}

void Student::display(){
	Person::display();
	cout<<"PRN is: "<<PRN<<endl<<"Course is: "<<course<<endl;
}

void Student::accept(){
	char temp_course[10];
	
	Person::accept();
	
	cout<<"Enter PRN and Course: "<<endl;
	cin>>PRN>>temp_course;
	
	int length = strlen(temp_course);	//DMA for string
	course = new char[length+1];
	strcpy(course, temp_course);
}

Student::~Student(){
	if(course)
		delete []course;
	
	course=NULL;
}
