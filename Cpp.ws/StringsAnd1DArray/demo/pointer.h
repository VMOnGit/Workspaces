#include<iostream>
using namespace std;

class Pointer
{
	int *ptr;
	
	public:
		Pointer();
		Pointer(int*);
		
		//user-defined copy-constructor
		Pointer(const Pointer&);// Const Parameter for function prevents function from modifying the parameter
		
		//Operator overloading
		void operator=(Pointer &p);	
		void display();
		
		~Pointer(); //user-defined destructor
};


		
