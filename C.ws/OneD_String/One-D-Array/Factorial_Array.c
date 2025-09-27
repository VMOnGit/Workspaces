#include<stdio.h>
void fact(int*);
void display(int[]);
int main()
{ 
 	int tab[6];
 		fact(tab);
 	display(tab);
 	return 0;
 }
 
void fact(int*tab)
{	
	
	for(int i=2;i<=7;i++)
	{
		int n=1;
		for(int j=i;j>0;j--){	
			n=n*j;
		}
		tab[i-2]=n;
	}
}
void display(int tab[])
{
	for(int i=0;i<6;i++)
	{
		printf("facts are %d\n",tab[i]);
	}
}
