#include <stdio.h>
void display(int);
int main(){
	int n;
	printf("Enter Upper Limit:");
	scanf("%d",&n);
	display(n);
	return 0;
}

void display(int n){
	if(n>0){
	printf("%d\n",n);
	display(n-1);

	}else
		return;
}
