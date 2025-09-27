#include <iostream>
using namespace std;

inline int square(int n1){return n1*n1;}
inline int cube(int n1){return n1*n1*n1;}
inline int max(int n1, int n2){return (n1>n2)?n1:n2;}


int main(){
		int ch,a,s,c;
		cout<<"Enter your choice of shape to find area and perimeter of:\n\
		 1: Square and Cube\n\
		   2: Max\n\
		   3: Quit\n";
		cin>>ch;
		switch(ch){
			case 1: cout<<"Enter number to be squared and cubed:"<<endl;
					cin>>a;
					s=square(a);
					c=cube(a);
					cout<<"Square:"<<s<<endl<<"Cube"<<c<<endl;
					break;
			case 2: cout<<"Enter the numbers for min and max:"<<endl;
					cin>>s>>c;
					a=max(s,c);
					cout<<"The max is:"<<a<<endl;
					break;
			case 3: return 0;
			default:"Invalid Input";
		}
		   
		   
}


