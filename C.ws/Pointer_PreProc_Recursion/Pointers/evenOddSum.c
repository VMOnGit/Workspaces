#include <stdio.h>

void evenOdd(int ,int *,int *);
int main(){
	int limit,evenSum,Oddsum;
	printf("Enter the limit:");
	scanf("%d",&limit);
	evenOdd(limit,&evenSum,&Oddsum);
	printf("The Even Sum is %d and the Odd Sum is %d\n",evenSum,Oddsum);
}


void evenOdd(int limit,int *evenSum,int *Oddsum){
	*evenSum=0;*Oddsum=0;
	for(int i = 0;i<limit;i++){
		if(i%2==0)
			*evenSum=*evenSum+i;
		else
			*Oddsum=*Oddsum+i;
	}
}
