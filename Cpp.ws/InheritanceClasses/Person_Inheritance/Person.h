
#pragma once
#include<iostream>
#include<string.h>

using namespace std;

class Person
{
	private:
		char *name;
		char *pan_id;
		int age;
				
	public:
		Person();
		Person(char*, char*, int);
		void display();
		void accept();
		~Person();
};


