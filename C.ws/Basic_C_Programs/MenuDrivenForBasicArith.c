#include <stdio.h>

int main() {
	int userin;
	int num1,num2;
	int out;
	while(1){
	printf("\nEnter 2 number to perform operation");
	scanf("%d%d",&num1,&num2);
	printf("Enter the operation to perform\n1 for multiplication\n2 for addition\n3 for subtraction\n4 for division\n5 to quit\n");
	scanf("%d",&userin);
	
	switch(userin){
	    case 1:
	        out = num1*num2;
	        break;
	    case 2:
	        out = num1+num2;
	        break;
	    case 3:
	        out = num1-num2;break;
	    case 4:
	        out =num1/num2;break;
	   default: 
	        printf("Invalid Operation");
	}
	
  
  if(userin==5)break;
  printf("Result is :%d",out);
	} 

}
}