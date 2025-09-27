#include <stdio.h>
void display(int,int);
int main(){
	int n,sum=0;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	display(n,sum);
	return 0;
}

void display(int n,int sum){
	if(n>0){
	sum=sum+n;
	display(n-1,sum);
	printf("%d\n",n);
	
	
	

	}else
	{	
	printf("sum is %d\n",sum);
	}
		return;
}
