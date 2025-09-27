#include "ArrayClass.h"

Array::Array(int size){
  this->size=size;
  this->arr=new int(this->size); //DMA Concept
}

int* Array::getArrayPointer(){
  return this->arr;
}

int Array::getArraySize(){
  return this->size;
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

int Array::operator[](int index){
  if ((this->size-1)>=index&&(index>=0))
    return *(this->arr+index);
  else
    return ;
}






