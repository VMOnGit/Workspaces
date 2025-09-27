#pragma once
#include <iostream>
#include <string.h>
using namespace std;

class String{
	private:
		char *name;
		int length;
		
	public:
		String();
		String(const char*);
		void display();
		~String();
};


