#include<stdio.h>
#define SIZE 3
void accept(int (*)[SIZE]);
void transpose(int (*)[SIZE],int(*)[SIZE]);
void display(int (*)[SIZE]);
int main()
{ 
 	
 	int tab[SIZE][SIZE],tran[SIZE][SIZE];
 	accept(tab);
 	transpose(tab,tran);
 	display(tab);
 	printf("Transposed array is:\n");
 	display(tran);
	return 0;
}

void accept(int (*tab)[SIZE]){
	printf("Enter Values\n");
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			scanf("%d",&tab[i][j]);
	}
}

void transpose(int (*tab)[SIZE],int (*tran)[SIZE]){
             printf("Enter Values\n");
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			tran[i][j]=tab[j][i];
	}
}
	

void display(int (*tran)[SIZE])
{
	for(int i=0;i<3;i++){
		for(int j=0;j<3;j++)
		{
		printf("%d\t",tran[i][j]);
		}printf("\n");
	}
}
