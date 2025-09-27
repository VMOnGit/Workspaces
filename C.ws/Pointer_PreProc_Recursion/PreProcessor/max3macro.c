#include <stdio.h>
#define MAX(n1,n2,n3) ((n1>n2)?((n1>n3)?n1:n2):n3)

int main(){
	int n1,n2,n3 ,result;
	printf("Enter 3 numbers to compare:");
	scanf("%d%d%d",&n1,&n2,&n3);
	result = MAX(n1,n2,n3);
	printf("The Max is %d\n",result);
	return 0;
}
