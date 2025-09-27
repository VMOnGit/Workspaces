#include<stdio.h>
int square(int);
int cube(int);

int main(){
	int num,Square,Cube;
	printf("Enter number to find square and cube of:");
	scanf("%d",&num);
	Square = square(num);
	Cube = cube(num);
	printf("The square is:%d\nThe cube is:%d\n",Square,Cube);
	
}

int square(int num){
	int result;
	result = num*num;
	return result;
}

int cube(int num){
	int result;
	result = num*square(num);
	return result;
}
