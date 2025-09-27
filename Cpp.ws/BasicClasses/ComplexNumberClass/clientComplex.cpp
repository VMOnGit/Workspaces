#include "Complex.h"
#include <iostream>

 void Complex::display(){
 	cout<<"\nComplex::"<<Real<<"+"<<Imag<<"i"<<endl;
}
 void Complex::accept()
 {
	cout<<"\nEnter Complex:: ";
	cin>>Real>>Imag;
}

int main(){
	Complex num1;
	num1.accept();
	num1.display();
	num1.setReal(10);
	num1.display();
	num1.setImag(-1);
	num1.display();
}


