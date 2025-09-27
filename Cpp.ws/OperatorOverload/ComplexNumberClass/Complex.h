#include<iostream>
using namespace std;

class Complex
{
	int Real=1,Imag=1;
	
	public:
		
		
		Complex() = default;
		Complex(int,int);
		int getReal();
		int getImag();
		
		void setReal(int);
		void setImag(int);
		
		void accept();
		void display();
		
		Complex operator+(Complex&);//This supresses implicit copy constructor
		Complex operator+(int);
				
		Complex operator-(Complex&);
		Complex operator-(int);
		
		Complex operator-();//Inversion
		
		Complex operator*(Complex&);
		Complex operator*(int);
		
		Complex operator/(Complex&);
		Complex operator/(int);
		
		bool operator<(Complex&);
		bool operator<(int);
		
		bool operator>(Complex&);
		bool operator>(int);
		
		bool operator==(Complex&);
		bool operator==(int);
		
		bool operator!=(Complex&);
		bool operator!=(int);
		
		Complex operator+=(Complex&);
		Complex operator+=(int);
		//Unary
		Complex operator++();
		Complex operator--();    //pre --
		Complex operator--(int); //post --
		Complex operator++(int); //post ++
		//friend functions
		friend Complex operator+(int,Complex&);
		
		friend Complex operator-(int,Complex&);
		
		friend Complex operator*(int,Complex&);
		
		friend Complex operator/(int, Complex&);
		
		friend ostream& operator<<(ostream&,Complex&);
		friend istream& operator>>(istream&,Complex&);
		//Assignment:: Overload -,+,*,/ and Pre &Post --
		//Assignment:: Overload >>
		
};
