#include <stdio.h>
#define MULTI(n1,n2) n1*n2

int main(){
	int n1,n2,sum;
	printf("Enter 2 numbers to multiply:");
	scanf("%d%d",&n1,&n2);
	sum= MULTI(n1,n2);
	printf("The Product is %d\n",sum);
	return 0;
}
