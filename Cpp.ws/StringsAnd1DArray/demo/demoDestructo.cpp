#include "pointer.h"

Pointer::Pointer()
{
	ptr=NULL;
}

Pointer::Pointer(int* p)
{
	this -> ptr = p;
}

Pointer::Pointer(const Pointer &p)
{
	this->ptr=new int(*p.ptr);
	
}
void Pointer::display()
	
{
	if(ptr!=NULL)
		cout<<"\n*ptr="<<*ptr;
}

void Pointer::operator=(Pointer &p){
	if((this) == &p){
		cout<<"\n\t No operation"<<endl;
		return;
	}else{
		if(this->ptr)
			delete ptr;
		
		cout<<"\n\t User defined operator "<<endl;
		this->ptr=new int;
		*this->ptr = *p.ptr;
	}
}

//Destructor
Pointer::~Pointer()
{
	if(ptr!=NULL)
	{
	cout<<"\nDestructo invoked for"<<*ptr<<endl;
	delete []ptr;
	}
	ptr=NULL;
}
