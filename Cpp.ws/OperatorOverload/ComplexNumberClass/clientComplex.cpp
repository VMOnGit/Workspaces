#include "Complex.h"
#include <iostream>



int main(){
	Complex num1,num2,num3,num4;
	num1.accept();
	num2.accept();
	num3.accept();
	num4.accept();
	num1 = num2+num3;
	num1.display();
	num1 = num2-num3;
	num1.display();
	num1 = num2-3;
	num1.display();
	num1 = 3-num2;
	num1.display();
	num1 = num2*num3;
	num1.display();
	num1 = num2/num3;
	num1.display();
	num1 = num2*num3+num4;
	num1.display();
	
	cout<<num1<<num2;
	cin>>num3>>num2;
}


