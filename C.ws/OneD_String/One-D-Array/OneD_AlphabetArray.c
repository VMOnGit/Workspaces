#include<stdio.h>
#define SIZE 26
void table(char*,int);
void display(char[]);
int main()
{ 
 	int num;
 	char tab[SIZE];
 	table(tab,num);
 	display(tab);
 	return 0;
 }
 
void table(char*tab,int num)
{
	for(int i=0;i<26;i++)
	{
		tab[i]=("%c",i+65);
	}	
}
void display(char tab[])
{
	for(int i=0;i<SIZE;i++)
	{
		printf("%c\n",tab[i]);
	}
}
