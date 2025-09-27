#include "Time.h"
#include <iostream>

int main()
{
	Time t1;
	Time t2;
	Time t3;
	t1.accept();
	t1.display();
	
	cout<<"t3:"<<endl;
	t3.display();
	t3.setHour(20);
	cout<<"t3 updated:"<<endl;
	t3.display();
	
	t2.accept();
	cout<<"t2:"<<endl;
	t2.display();
	
	t2.setMin(48);
	cout<<"t2 updated:"<<endl;
	t2.display();
	
	t1.setSec(59);
	cout<<"t1 updated:"<<endl;
	t1.display();
	 
	
	return 0;
}
