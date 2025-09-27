#include<stdio.h>
int findSum(int);

int main(){
	int userin,limit,result;
	printf("Enter limit:");
	scanf("%d",&limit);
	result = findSum(limit);
	printf("The sum is %d\n",result);
}

int findSum(int limit){
	int sum = 0;
	sum = (limit*(limit+1))/2;
	return sum;
}
