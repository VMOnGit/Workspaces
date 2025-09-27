#include <stdio.h>

void sqube(int ,int *,int *);


int main(){
	int num1,square,cube;
	printf("Enter the number:");
	scanf("%d",&num1);
	sqube(num1,&square,&cube);
	printf("The square and cube are:%d,%d\n",square,cube);
	return 0;
}

void sqube(int num1,int *square,int *cube){
	*square = num1*num1;
	*cube = num1*num1*num1;
}
