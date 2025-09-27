
 #include "Complex.h"



Complex::Complex(int r,int i){	
 	cout<<"\nParametrized Constructor Invoked:";
 	this->Real=r;
 	this->Imag=i;
}
//binary operator loading
//return-type class_name::method()
Complex Complex::operator+(Complex &c)//addition
{
	Complex temp;
	temp.Real=this->Real+c.Real;
	temp.Imag=this->Imag+c.Imag;
	return temp;
}
Complex Complex::operator+(int c)//addition int
{
	Complex temp;
	temp.Real=this->Real+c;
	temp.Imag=this->Imag+c;
	return temp;
}

Complex Complex::operator-(Complex &c)//Subtraction
{
	Complex temp;
	temp.Real=this->Real-c.Real;
	temp.Imag=this->Imag-c.Imag;
	return temp;
}


Complex Complex::operator-(int n)//subtraction int
{
	Complex temp;
	temp.Real=this->Real-n;
	temp.Imag=this->Imag-n;
	return temp;
}

Complex Complex::operator*(Complex & c)//Multiplication
{
	Complex temp;
	temp.Real=this->Real*c.Real;
	temp.Imag=this->Imag*c.Imag;
	return temp;

}

Complex Complex::operator*(int c)//Multiplication int
{
	Complex temp;
	temp.Real=this->Real*c;
	temp.Imag=this->Imag*c;
	return temp;

}

Complex Complex::operator/(Complex &c)//Division
{
	Complex temp;
	temp.Real=this->Real/c.Real;
	temp.Imag=this->Imag/c.Imag;
	return temp;

}

Complex Complex::operator/(int c)//Division int
{
	Complex temp;
	temp.Real=this->Real/c;
	temp.Imag=this->Imag/c;
	return temp;
}

bool Complex::operator<(Complex &c){	//Less than object
	return ((this->Real*this->Real)+(this->Imag*this->Imag))<((c.Real*c.Real)+(c.Imag*c.Imag));
}

bool Complex::operator<(int n){//Less than int
	return ((this->Real*this->Real)+(this->Imag*this->Imag))<(2*(n*n));
}
	/*	
Complex operator>(Complex &c){//Greater than obj
	return ((this->Real*this->Real)+(this->Imag*this->Imag))>((c.Real*c.Real)+(c.Imag*c.Imag));
}
Complex operator>(int n){//Greater than int
		return ((this->Real*this->Real)+(this->Imag*this->Imag))>(2*(n*n));
}
	*/	
bool Complex::operator==(Complex &c){//Equal to Obj
		return ((this->Real*this->Real)+(this->Imag*this->Imag))==((c.Real*c.Real)+(c.Imag*c.Imag));
}
		
bool Complex::operator==(int n){//Equal to int
		return ((this->Real*this->Real)+(this->Imag*this->Imag))==(2*(n*n));
}
/*		
Complex operator!=(Complex &c){//Not Equal Obj
	return ((this->Real*this->Real)+(this->Imag*this->Imag))!=((c.Real*c.Real)+(c.Imag*c.Imag));
}

Complex operator!=(int n){//Equal to int
		return ((this->Real*this->Real)+(this->Imag*this->Imag))!=(2*(n*n));
}
*/		
Complex Complex::operator+=(Complex &c){//add and assign obj
	this->Real+=c.Real;
	this->Imag+=c.Imag;
	return (*this);
}

Complex Complex::operator+=(int n){//add and assign int
	this->Real+=n;
	this->Imag+=n;
	return (*this);
}
		
		
Complex Complex::operator-()//inversion
{
	Complex temp;
	temp.Real=-this->Real;
	temp.Imag=-this->Imag;
	return temp;
}
//friend function
Complex operator+(int n,Complex &c)	//Friend Addition
{
	Complex temp;
	temp.Real=c.Real+n;
	temp.Imag=c.Imag+n;
	return temp;
}
Complex operator-(int n,Complex &c)	//Friend Subtraction
{
	Complex temp;
	temp.Real=n-c.Real;
	temp.Imag=n-c.Imag;
	return temp;
}

Complex operator*(int n,Complex &c)//Friend Multiplication
{
	
	Complex temp;
	temp.Real=c.Real*n;
	temp.Imag=c.Imag*n;
	return temp;

}

Complex operator/(int n,Complex &c)//Friend Division
{
	Complex temp;
	temp.Real=n/c.Real;
	temp.Imag=n/c.Imag;
	return temp;
}


ostream& operator<<(ostream &o,Complex &c)//cout<<
{
	o<<"\nComplex::"<<c.Real<<"+"<<c.Imag<<"i"<<endl;
	return o;
}
istream& operator>>(istream &i,Complex &c)//cin>>
{
	cout<<"\nEnter Complex:: ";
	i>>c.Real>>c.Imag;
	return i;
}

//Unary Operators
Complex Complex:: operator++()	//Pre Increment
{
	this->Real++;
	this->Imag++;
	return (*this);
}

Complex Complex:: operator++(int n)	//Post-Increment, int n is for compiler(fn over)
{
	Complex temp;
	temp = (*this);
	this->Real++;
	this->Imag++;
	return temp;
}
Complex Complex:: operator--()
{
	this->Real--;
	this->Imag--;
	return(*this);
	}

Complex Complex::operator--(int n)
{;
	this->Imag--;
	Complex temp;
	temp=(*this);
	this->Real--;
	return temp;


}

 void Complex::display(){
 	cout<<"\nComplex::"<<Real<<"+"<<Imag<<"i"<<endl;
}
 void Complex::accept()
 {
	cout<<"\nEnter Complex:: ";
	cin>>Real>>Imag;
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

	
