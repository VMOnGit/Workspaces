#include <stdio.h>
void swap(int *,int *);

int main(){
	int num1,num2;
	printf("Enter 2 numbers:");
	scanf("%d %d",&num1, &num2);
	swap(&num1,&num2);
	printf("Swapped numbers are:%d,%d\n",num1,num2);
	return 0;
}

void swap(int *num1,int *num2){
	*num1 = (*num1)^(*num2);
	*num2 = (*num1)^(*num2);
	*num1 = (*num1)^(*num2);
}
