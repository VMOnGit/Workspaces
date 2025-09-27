#include<stdio.h>
int prime(int);
int main(){
	int num,result;
	printf("Enter the number to check:");
	scanf("%d",&num);
	result = prime(num);
	if(result){
		printf("%d is prime\n",num);
	}else{
		printf("%d is not prime\n",num);
	}
}


int prime(int num){

	int i,j;
	j=0;
	for(i=2;i<num/2;i++){
		if(num%i==0){
			j=1;
			break;
		}
		}if(j==0){
			return 1;
		}else{
			return 0;
		};
}
