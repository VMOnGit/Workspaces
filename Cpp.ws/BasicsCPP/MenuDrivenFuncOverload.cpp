#include <iostream>
using namespace std;

void sum(int,int);
void sum(float,float);
void sum(float,int);
void sum(int,float);

int main(){
	int ch;
	int num1,num2;
	cout<<"\n 1: 2,int\n\
			  2: 2,float\n\
			  3: int,float\n\
			  4: float,int\n\
			  0: EXIT";
	cout<<"Enter your choice";
	cin>>ch;
	switch(ch){
		case 1:
			
			cout<<"Enter numbers to add\n";
			cin>>num1>>num2;
			sum(num1,num2);
			break;
		case 2:
			
			cout<<"Enter numbers to add\n";
			cin>>static_cast<float>(num1)>>static_cast<float>(num2);
			sum(num1,num2);
			break;
		case 3:
			int num1;
			float num2;
			cout<<"Enter numbers to add\n";
			cin>>num1>>static_cast<float>(num2);
			sum(num1,num2);
			break;
		case 4:
			float num1;
			int num2;
			cout<<"Enter numbers to add\n";
			cin>>static_cast<float>(num1)>>num2;
			sum(num1,num2);
			break;
		case 5:
			return 0;
		default:
			cout<<"wrong input"<<endl;
			break;
	}
}
void sum(int num1,int num2){
	cout<<"The Sum is"<<(num1+num2);
}
void sum(int num1,float num2){
	cout<<"The Sum is"<<static_cast<int>(num1+num2);
}
void sum(float num1,int num2){
	cout<<"The Sum is"<<(static_cast<float>(num1+num2));
}
void sum(float num1,float num2){
	cout<<"The Sum is"<<(num1+num2);
}
