#include <stdio.h>
void display(int,int,int,int);
int main(){
	int n,a=0,b=1,c=0,limit;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	limit = n;
	display(a,b,c,limit);
	return 0;
}

void display(int a,int b,int c,int limit){
	
	if(limit>a){
	c=a+b;
	b=a;
	a=c;
	display(a,b,c,limit);
	printf("%d\n",b);
	
	
	

	}else
	{	
	return;
	}
		
}



