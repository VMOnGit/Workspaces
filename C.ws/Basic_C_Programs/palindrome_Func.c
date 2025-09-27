#include<stdio.h>
void palindrome(int);
int main()
{ 
	int num;
	printf("Enter the number");
	scanf("%d",&num);
	palindrome(num);
	return 0;
}
	
void palindrome(int num)
{ 	
	int temp,rem,rev;
	temp=num;
	while(num>0)
        {
	rem=num%10;
	num=num/10;
	rev=rev*10+rem;
        }
	if (temp==rev)
        {
	printf("It is a palindrome\n");
        }
	else
        {
	printf("It is not palindrome\n"); 
        }
	
}
	
	

