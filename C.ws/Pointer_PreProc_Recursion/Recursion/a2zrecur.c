#include <stdio.h>
void display(int);
int main(){
	int n=65;
	display(n);
	return 0;
}

void display(int n){
	if(n<91){
	printf("%c\n",n);
	display(n+1);
	}else
		return;
}
