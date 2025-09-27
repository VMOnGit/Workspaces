#include<stdio.h>

void multi(int (*)[4]);
void display(int (*)[4]);
int main()
{ 
 	
 	int tab[10][4];
 	accept(tab);
 	multi(tab);
 	display(tab);
	return 0;
}



void multi(int (*tab)[4]){

	for(int i=2;i<=5;i++)
		for(int j = 0;j<10;j++)
	{
		tab[j][i-2]=(i)*(j+1);
	}
}
void display(int (*tab)[4])
{
	for(int i=2;i<=5;i++){
		for(int j=0;j<10;j++)
		{
		printf("%dx%d=%d\n",i,j+1,tab[j][i-2]);
		}
	}
}
