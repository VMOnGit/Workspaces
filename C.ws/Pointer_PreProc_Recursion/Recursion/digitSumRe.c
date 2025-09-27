#include <stdio.h>

void digitS(int,int,int);
int main(){
	int num,rem,digitSum=0;
	printf("Enter number:");
	scanf("%d",&num);
	digitS(num,rem,digitSum);
}

void digitS(int num,int rem,int digitSum){
	if(num>0){
		rem = num%10;
		num = num/10;
		digitSum = digitSum+rem;
		digitS(num,rem,digitSum);
	}else
		printf("Sum of digits is %d\n",digitSum);
		return;
}
