
#include<iostream>
using namespace std;

class Array{
  int size=5;
  int *arr;
  
  public:
  	Array();
    Array(int size);
    ~Array();
    friend ostream& operator<<(ostream&, Array&);
    friend istream& operator>>(istream&, Array&);
    

    int& operator[](int);

    
    Array& operator=(Array&);
    
    Array& operator+(Array&);
    
    int* getArrayPointer();
    int getArraySize();
    //void Array::operator[](int index,int n);
    
  
};


