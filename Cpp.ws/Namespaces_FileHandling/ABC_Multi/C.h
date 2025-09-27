#pragma once
#include "A.h"
using namespace std;

class C: public virtual A{
	int c;
	public:
		C(){
			c=0;
		}
		
		C(int n1,int n2):A(n1){
		 c=n2;
		}
		
		void display(){
			cout<<"\n C::"<<c<<endl;
		}
};
