#include <stdio.h>
#define SQUA(num) num*num
#define CUBE(num) SQUA(num)*num
int main(){
	int num ,sq,cu;
	printf("Enter one number to find square and cube of:");
	scanf("%d",&num);
	sq = SQUA(num);
	cu=CUBE(num);
	printf("The Square and the Cube is %d\t%d\n",sq,cu);
	
	return 0;
}
