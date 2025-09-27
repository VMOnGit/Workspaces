#include "pointer.h"
int main()
{
	Pointer P;
	P.display();
	
	Pointer p2(new int(10));
	p2.display();
	
	//Pointer p3(p2);
	Pointer p3;
	p3 = p2;
	p3.display();
	
	return 0;
}

