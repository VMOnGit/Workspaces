#include <iostream>
using namespace std;

void circAP(int,const float,int&,int&);
void recAP(int,int,int&,int&);
void sqAP(int,int&,int&);
void triAP(int,int,int&,int&);

int main(){
	int ch;
	int num1=0,num2=0;
	const float PI = 3.14f;
	int area,peri;
	cout<<"Enter your choice of shape to find area and perimeter of:\n\
		\t 1: Circle\n\
			  2: Rectangle\n\
			  3: Square\n\
			  4: Triangle\n\
			  5: EXIT";
	cout<<"\nEnter your choice";
	cin>>ch;
	switch(ch){
		case 1:
			cout<<"Enter Radius of Circle\n";
			cin>>num1;
			circAP(num1,PI,area,peri);
			cout<<"The area is "<<area<<endl<<"Circumference is "<<peri<<endl;
			break;
		case 2:
			cout<<"Enter Length and Breadth of Rectangle\n";
			cin>>num1>>num2;
			recAP(num1,num2,area,peri);
			cout<<"The area is "<<area<<endl<<"Perimeter is "<<peri<<endl;
			break;
		case 3:
			cout<<"Enter side of square\n";
			cin>>num1;
			sqAP(num1,area,peri);
			cout<<"The area is "<<area<<endl<<"Perimeter is "<<peri<<endl;
			break;
		case 4:
			cout<<"Enter Base and altitude of Triangle\n";
			cin>>num1>>num2;
			triAP(num1,num2,area,peri);
			cout<<"The area is "<<area<<endl<<"Perimeter is "<<peri<<endl;
			break;
		case 5:
			return 0;
		default:
			cout<<"wrong input"<<endl;
			break;
	}
}
void circAP(int radius,const float PI,int &area,int &peri){

	area = PI*radius*radius;
	peri = 2*PI*radius;

}
void recAP(int num1,int num2,int &area,int &peri){
	area = num1*num2;
	peri = 2*(num1+num2);
}
void sqAP(int num1,int &area,int &peri){
	area = num1*num1;
	peri = 4*num1;
}
void triAP(int num1,int num2,int &area,int &peri){
	area = 0.5*(num1*num2);
	peri = 3*num1;
}
