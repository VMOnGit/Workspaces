#include <stdio.h>

void maxMin(int,int,int,int*,int*);

int main(){
	int num1,num2,num3;
	int Max,Min;
	printf("Enter 3 numbers to find min and max");
	scanf("%d%d%d",&num1,&num2,&num3);
	maxMin(num1,num2,num3,&Max,&Min);
	printf("min is %d and max is %d\n",Min,Max);
	return 0;
}

void maxMin(int n1,int n2,int n3,int*max,int*min){
	if(n1>n2&&n1>n3){
		*max = n1;
		*min = (n2>n3)?n3:n2;
	 }else if(n2>n1&&n2>n3){
	 	*max = n2;
	 	*min = (n1>n3)?n3:n1;
 	}else{
 		*max = n3;
 		*min = (n2>n1)?n1:n2;
	}
}

