#include "Vector.h"

int main(){
	Vector v1,v2,v3;
	v1.accept();
	v2.accept();
	v3.accept();
	v1 = v2+v3;
	v1.display();
	v1 = v2-v3;
	v1.display();
	v1++;
	v1.display();
	v1--;
	v1.display();
	cout<<v1.getX();
	cout<<v1.getY();
	v1.setX(10);
	cout<<v1.getX();
}
