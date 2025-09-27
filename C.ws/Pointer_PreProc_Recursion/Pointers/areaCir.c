#include <stdio.h>
#define PI 3.14f


void areaCir(int ,int *,int *);
int main(){
	int radius,area,cir;
	printf("Enter the Radius:");
	scanf("%d",&radius);
	areaCir(radius,&area,&cir);
	printf("The area is %d and the circumference is %d\n",area,cir);
}


void areaCir(int r,int *ar,int *cir){
	*ar = PI*r*r;
	*cir = 2*PI*r;
}
