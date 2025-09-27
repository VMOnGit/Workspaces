#include<iostream>
using namespace std;

class Time
{
	int hh=1,mm=1,ss=1;
	
	public:
		
		
		Time() = default; //user-defined
		Time(int,int,int);
		int getHour();
		int getMin();
		int getSec();
		void setHour(int);
		void setMin(int);
		void setSec(int);
		void accept();
		void display();
		
};
