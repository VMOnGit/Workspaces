#include <stdio.h>
void display(int,int);
int main(){
	int n,fact=1;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	display(n,fact);
	return 0;
}

void display(int n,int fact){
	if(n>0){
	fact=fact*n;
	display(n-1,fact);
	printf("%d\n",n);
	
	
	

	}else
	{	
	printf("factorial is %d\n",fact);
	}
		return;
}
