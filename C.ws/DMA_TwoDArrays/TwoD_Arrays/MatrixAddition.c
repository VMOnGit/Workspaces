#include<stdio.h>
#define SIZE 3
void accept(int (*)[SIZE]);
void sum(int (*)[SIZE],int(*)[SIZE],int(*)[SIZE]);
void display(int (*)[SIZE]);
int main()
{ 
 	
 	int tab[SIZE][SIZE],tran[SIZE][SIZE],add[SIZE][SIZE];
 	accept(tab);
 	accept(tran);
 	sum(tab,tran,add);
 	printf("The first array is:\n");
 	display(tab);
 	printf("The second array is:\n");
 	display(tran);
 	printf("Sum of two array is:\n");
 	display(add);
	return 0;
}

void accept(int (*tab)[SIZE]){
	printf("Enter Values\n");
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			scanf("%d",&tab[i][j]);
	}
}

void sum(int (*tab)[SIZE],int (*tran)[SIZE],int(*add)[SIZE]){
             printf("Enter Values\n");
	for(int i=0;i<SIZE;i++){
		for(int j=0;j<SIZE;j++)
			add[i][j]=tab[i][j]+tran[i][j];
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
