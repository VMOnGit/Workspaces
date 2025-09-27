#include "Person.h"

class Student:public Person{
	private:
		double PRN=0;
		char* course;
	
	public:
		Student()=default;
		Student(char*, char*, int, double, char*);
		void display();
		void accept();
		~Student();
};
