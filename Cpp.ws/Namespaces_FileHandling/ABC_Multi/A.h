#pragma once
#include <iostream>
using namespace std;

class A{
	int a;
	public:
		A(){
			a=0;
		}
		
		A(int n){
		 a=n;
		}
		
		void display(){
			cout<<"\n A::"<<a<<endl;
		}
};
