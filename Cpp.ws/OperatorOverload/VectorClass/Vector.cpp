#include "Vector.h"

Vector::Vector(int x,int y){
	this->X = x;
	this->Y = y;
}

void Vector::accept()
{
	cout<<"\nEnter Vector Number\n";
	cin>>X>>Y;
}

void Vector::display()
{
	cout<<"\nVector Number::"<<X <<"&" <<Y <<endl;
	
}

Vector Vector::operator+(Vector &c)
{
	Vector temp;
	temp.X = this-> X+c.X;
	temp.Y = this->Y+c.Y;
	
	return temp;
}

Vector Vector::operator-(Vector &c)
{
	Vector temp;
	temp.X = this-> X+c.X;
	temp.Y = this->Y+c.Y;
	
	return temp;
}

Vector Vector::operator++(int n)
{
	this ->X++;
	++this->Y;
	
	return (*this);
}

Vector Vector::operator--(int n)
{
	this ->X--;
	--this->Y;
	
	return (*this);
}

void Vector::setX(int x){
	this->X = x;
}

void Vector::setY(int y){
	this->Y = y;
}
int Vector::getX(){
	return this->X;
}

int Vector::getY(){
	return this->Y;
}
