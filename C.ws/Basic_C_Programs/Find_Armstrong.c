#include<stdio.h>


void arm(int);

int main(){
	int num;
	
	printf("Enter number:");
	scanf("%d",&num);	
	arm(num);
}


void arm(int num){
	int rem=0,temp,cube_sum;
	temp=num;
	while (num > 0) {
		rem= num % 10;
		num = num / 10;
		cube_sum = cube_sum+(rem*rem*rem);
    	}
    	if(temp==cube_sum){
    		printf("%d is Armstrong\n",temp);
    	}else{
    		printf("%d is not Armstrong\n",temp);
    	}
}
