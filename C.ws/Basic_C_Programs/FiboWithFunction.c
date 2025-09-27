#include<stdio.h>

void fibo(int);
int main(){
	int num;
	printf("Enter number:");
	scanf("%d",&num);
	fibo(num);
	
	}
	
	

void fibo(int num)
 { 
 int a,b,c;
 a=0;
 b=1;
 while(a<num){
  c=a+b;
 b=a;
 a=c;
printf("%d\n",b); 
 }}
