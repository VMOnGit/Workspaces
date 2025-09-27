#include<stdio.h>
void table(int*,int);
void display(int[],int);
int main()
{ 
 	int num,tab[10];
 	printf("Enter the number you wanna multiply:");
 	scanf("%d",&num);
 	table(tab,num);
 	display(tab,num);
 	return 0;
 }
 
void table(int*tab,int num)
{
	for(int i=0;i<10;i++)
	{
		tab[i]=(i+1)*num;
	}	
}
void display(int tab[],int num)
{
	for(int i=0;i<10;i++)
	{
		printf("%dx%d=%d\n",num,i+1,tab[i]);
	}
}
