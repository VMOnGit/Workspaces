#include <stdio.h>
#define MAX(n1,n2) (n1>n2)?n1:n2

int main(){
	int n1,n2, result;
	printf("Enter 2 numbers to compare:");
	scanf("%d%d",&n1,&n2);
	result = MAX(n1,n2);
	printf("The Max is %d\n",result);
}
