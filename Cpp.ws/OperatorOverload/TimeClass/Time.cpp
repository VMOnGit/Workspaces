
 #include "Time.h"

int getHour();

Time::Time(int h,int m,int s){	
 	cout<<"\nParametrized Constructor Invoked:";
 	this->hh=h;
 	this->mm=m;
 	this->ss=s;
}
 void Time::display(){
 	cout<<"\nTime::"<<hh<<":"<<mm<<":"<<ss<<std::endl;
}
 void Time::accept()
 {
	cout<<"\nEnter Time:: ";
	cin>>hh>>mm>>ss;
}

Time Time:: operator++(int n)	//Post-Increment, int n is for compiler(fn over)
{

	this->m++;
	return *this;

}

Time Time:: operator--(int n)	//Post-Increment, int n is for compiler(fn over)
{

	this->m--;
	return *this;
}


