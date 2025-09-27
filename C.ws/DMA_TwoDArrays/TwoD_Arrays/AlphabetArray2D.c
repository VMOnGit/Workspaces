#include<stdio.h>
#define SIZE 26


int main()
{ 
 	int num;
 	char tab[2][26];
 	

	for(int i=0;i<26;i++)
	{
		tab[0][i]=("%c",i+65);
		tab[1][i]=("%c",i+97);
	}	


	for(int i=0;i<SIZE;i++)
	{
		printf("%c\t%c\n",tab[0][i],tab[1][i]);
	}
	return 0;
}
