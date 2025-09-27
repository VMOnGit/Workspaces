#include<iostream>

using namespace std;

class Vector
{	
	
	private:
		int X=00,Y=00;
		
	public:
		Vector() = default;
		Vector(int,int);
		void accept();
		void display();
		
		void setX(int);
		void setY(int);
		
		int getX();
		int getY();
		
		Vector operator+(Vector&);
		Vector operator-(Vector&);
		Vector operator++(int);
		Vector operator--(int);
		
};
