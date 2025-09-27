/*
Q4-
Create class Array{int size, int* arr}. Implement essential constructors. 
And Overload operator << and >> to display and accept array values respectively.
And Overload operator [] to access value of single index position.
Note: Make Sure that the index position is not invalid.

class Array
{
  int size;
  int *arr;
  
  public:
    Array(int s);
    operator<<();
    operator>>();
    operator[]();
};

int main()
{
  Array a1(5);
  cin>>a1;
  cout<<a1;
  
  //value=a1.operator[](2);
  value=a1[2]; //operator[] function should return value of index 2
  a1[2]=100;
}

*/

#include<iostream>
using namespace std;

class Array{
  int size;
  int *arr;
  
  public:
    Array(int size);
    friend ostream& operator<<(ostream&, Array&);
    friend istream& operator>>(istream&, Array&);
    int operator[](int);
    int* getArrayPointer();
    int getArraySize();
  
};


