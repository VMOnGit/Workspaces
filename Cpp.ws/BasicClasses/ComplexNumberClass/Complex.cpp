
 #include "Complex.h"



Complex::Complex(int r,int i){	
 	cout<<"\nParametrized Constructor Invoked:";
 	this->Real=r;
 	this->Imag=i;
}


int Complex::getReal()
{	
	return this->Real;
}
int Complex::getImag()
{	
	return this->Imag;
}
void Complex::setReal(int r)
{	
	this->Real=r;
}
void Complex::setImag(int i)
{	
	this->Imag=i;
}

	
