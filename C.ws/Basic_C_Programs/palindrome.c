#include <stdio.h>

int main() {
	int userin,temp=0;
	int rem,n;
	printf("Enter the number:");
	scanf("%d",&userin);
	n = userin;
	while(userin%10!=0){
        rem = userin%10;
        userin = userin/10;
        temp = temp*10+rem;
	}      
	printf("Rev = %d",temp);
	if(n==temp){
	    printf("\nIt is a palindrome\n");}
	 else{
	     printf("\nIts not palindrome\n");
	 }
	}
