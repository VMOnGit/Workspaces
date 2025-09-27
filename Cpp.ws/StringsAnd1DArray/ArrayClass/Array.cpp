#include "Array.h"

Array::Array(){
	this->arr = new int(this->size);
}

Array::Array(int size){
  this->size=size;
  this->arr=new int(this->size); //DMA
}

int* Array::getArrayPointer(){
  return this->arr;
}

int Array::getArraySize(){
  return this->size;
}

Array& Array::operator=(Array &a){
	copy(a.arr,(a.arr+a.getArraySize()),this->arr);
	return (*this);
}

int& Array::operator[](int index){
  if ((this->size-1)>=index&&(index>=0))
    return *(this->arr+index);
  else
  	index = index+1000000;
    return index;
}

Array& Array::operator+(Array &a){
	Array temp(this->size);
	if(this->size==a.getArraySize()){
		for(int k=0;k<a.getArraySize();k++){
	    	this->arr[k] = this->arr[k]+a.arr[k];
  		}
  	}	
  	
  	return *this;
}


istream& operator>>(istream& i, Array& arr){
  short k;
  int* ptr=arr.getArrayPointer();
  for(k=0;k<arr.getArraySize();k++){
    i>>*(ptr+k);
  }
  return i;
}

ostream& operator<<(ostream& o, Array& arr){
  short k;
  int* ptr=arr.getArrayPointer();
  for(k=0;k<arr.getArraySize();k++){
    o<<*(ptr+k)<<endl;
  }
  return o;
}


Array::~Array()
{
	int* ptr = this->arr;
	if(ptr!=NULL)
	{
	cout<<"\nDestructo invoked for"<<*ptr<<endl;
	delete []ptr;
	}
	ptr=NULL;
}




