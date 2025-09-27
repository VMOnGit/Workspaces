#pragma once

#include "B.h"
#include "C.h"


class C: public B,public C{
	
	public:
		D(){}
		
		D(int n1,int n2,int n3):B(n1,n2),C(n1,n3),A(n1){}
		
		void display(){
			B::display();
			C::display();
		}
};
