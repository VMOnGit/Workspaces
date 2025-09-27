#include <stdio.h>
#include "macros.h"
#define PI 3.14f
int main() {
	int userin;
	int l,b;
	int area,peri;
	while(1){
	printf("Enter the operation to perform\n1 for circle\n2 for square\n3 for rectangle\n4 for triangle\n5 to quit\n");
	scanf("%d",&userin);
	
	switch(userin){
	    case 1:
	        printf("Enter radius:");
	        scanf("%d",&l);
	        area = AREAC(PI,l);
	        peri = PERIC(PI,l);
	        printf("The area of circle %d peri is %d\n",area,peri);
	        break;
	    case 2:
	        printf("Enter side of square:");
	        scanf("%d",&l);
	        area = AREASQ(l);
	        peri = PERISQ(l);
	        printf("The area of square %d peri is %d\n",area,peri);
	        break;
	    case 3:
	        printf("Enter length and breadth:");
	        scanf("%d%d",&l,&b);
	        area = AREAREC(l,b);
	        peri = PERIREC(l,b);
	        printf("The area of rectangle %d peri is %d\n",area,peri);
	        break;
	    case 4:
	        printf("Enter altitude and base:");
	        scanf("%d%d",&l,&b);
	        area = AREATRI(l,b);
	        peri = PERITRI(b);
	        printf("The area of triangle %d peri is %d\n",area,peri);
	        break;
	    
	   default: 
	        printf("Invalid Operation\n");
	}
	
  
  if(userin==5)
  	break;
  
	} 

}

