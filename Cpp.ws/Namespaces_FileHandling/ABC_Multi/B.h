#pragma once
#include "A.h"

class B:public virtual A{
	int b;
	public:
		B(){
			b=0;
		}
		
		B(int n1,int n2):A(n1){
		 b=n2;
		}
		
		void display(){
			A::display();
			cout<<b<<endl;
		}
};
