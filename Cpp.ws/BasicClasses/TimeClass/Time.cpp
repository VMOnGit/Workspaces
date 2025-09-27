
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

int Time::getHour()
{	
	return this->hh;
}
int Time::getMin()
{	
	return this->mm;
}
int Time::getSec()
{	
	return this->ss;
}
void Time::setHour(int h)
{	
	this->hh=h;
}
void Time::setMin(int m)
{	
	this->mm=m;
}
void Time::setSec(int s)
{	
	this->ss=s;
}
	
