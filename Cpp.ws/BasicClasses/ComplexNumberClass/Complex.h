#include<iostream>
using namespace std;

class Complex
{
	int Real=1,Imag=1;
	
	public:
		
		
		Complex() = default; //user-defined
		Complex(int,int);
		int getReal();
		int getImag();
		
		void setReal(int);
		void setImag(int);
		
		void accept();
		void display();
		
};
