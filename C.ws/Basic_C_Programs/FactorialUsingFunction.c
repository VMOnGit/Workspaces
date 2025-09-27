#include<stdio.h>
void fact(int);

int main()
{
	int num;
	printf("Enter the number\n");
	scanf("%d",&num);
	fact(num);
	return 0;
}
	
void fact(int num)
{ 
int facto=1;

	for(int i=1;i<=num;i++)
	{
          facto=facto*i;
	} 
	printf("Factorial is %d",facto);
	

}	
