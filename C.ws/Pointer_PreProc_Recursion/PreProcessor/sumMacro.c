#include <stdio.h>
#define SUM(n1,n2) n1+n2

int main(){
	int n1,n2,sum;
	printf("Enter 2 numbers to add:");
	scanf("%d%d",&n1,&n2);
	sum= SUM(n1,n2);
	printf("The Sum is %d\n",sum);
	return 0;
}
