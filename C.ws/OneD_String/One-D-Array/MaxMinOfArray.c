#include<stdio.h>
void maxMin(int*,int*);
void display(int[]);
int main()
{ 
 	int tab[10];
 	int maxmin[2];
 	for(int i =0;i<10;i++){
 		printf("Enter %d th element of array",i+1);
 		scanf("%d",&tab[i]);
 	}
 	maxMin(tab,maxmin);
 	display(maxmin);
 	return 0;
 }
 
void maxMin(int*tab,int*maxmin)
{	
	int max;
	int min;
	
	for(int i=0;i<10;i++)
	{
		for(int j=0;j<10;j++){
			if(tab[i]>tab[j] && max<tab[i]){
				max = tab[i];
			}else if(tab[i]<tab[j] && min>tab[i]){
				min = tab[i];
			}
		}
		
		
	}maxmin[0]=max;
	maxmin[1]=min;
}
void display(int maxmin[])
{	
	printf("max and min are:");
	for(int i=0;i<2;i++)
	{
		printf("\t%d",maxmin[i]);
	}printf("\n");
}
