#include <stdio.h>
void display(int,int,int);
int main(){
	int n,fact=1,limit=10;
	printf("Enter the number:");
	scanf("%d",&n);
	display(n,fact,limit);
	return 0;
}

void display(int n,int fact,int limit){
	if(limit>0){
	fact=n*limit;
	display(n,fact,limit-1);
	printf("%dx%d=%d\n",n,limit,fact);
	
	
	

	}else
	{	
	return;
	}
		
}
