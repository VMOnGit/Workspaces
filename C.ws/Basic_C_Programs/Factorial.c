#include <stdio.h>

int main() {
	int userin;
	int prod=1,num;
	printf("Enter number to find factorial:");
	scanf("%d",&userin);
	for(int i = userin;i>0;i--){
	   
	    prod = prod*i;
	}
	printf("Factorial is %d",prod);
    
}