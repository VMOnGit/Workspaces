#include<iostream>
using namespace std;

class Date
{
	int day=1,month=1,year=1;
	static int new_year;
	public:
		
		Date(); //user-defined
		Date(int,int,int);
		
		int getYear();
		void setYear(int);
		
		void accept();
		void display();
		
		void staticDisplay();
		
		static void setNewYear(int);
		static int getNewYear();
		
};
