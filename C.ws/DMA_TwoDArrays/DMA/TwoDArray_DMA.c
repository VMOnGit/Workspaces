#include <stdio.h>
#include <stdlib.h>

int** accept(int **,int ,int);
void display(int **,int,int);
int** allocate(int **,int ,int );
void deallocate(int **, int );
int** sum(int **,int **,int **,int ,int );

int main(){
	int **arr1=NULL,**arr2=NULL,**result=NULL;
	int col,row_size;
	printf("Enter col size and row size: ");
	scanf("%d%d",&col,&row_size);
	
	arr1 = allocate(arr1,col,row_size);
	arr2 = allocate(arr2,col,row_size);
	result = allocate(result,col,row_size);
	
	arr1=accept(arr1,row_size,col);
	display(arr1,row_size,col);
	arr2=accept(arr2,row_size,col);
	display(arr2,row_size,col);
	
	result=sum(arr1,arr2,result,row_size,col);
	display(result,row_size,col);
	
	deallocate(arr1,row_size);
	deallocate(arr2,row_size);
	deallocate(result,row_size);
	
	
}
   
   


void display(int **arr,int row_size,int col){
	int i,j;
	printf("\nValues:: \n");
       for(i=0;i<row_size;i++)
	{	
		for(j=0;j<col;j++)
		{
			printf("%d\t",arr[i][j]);
		}printf("\n");
         }
}

int** accept(int** arr,int row_size,int col){
	int i,j;
	printf("Enter elements in Matrix");
	for(i=0;i<row_size;i++)
	{	
		for(j=0;j<col;j++)
		{
			scanf("%d",&arr[i][j]);
		}
    }
    return arr;
         
}
int** allocate(int** arr,int row_size,int col){
	int i;
	arr=(int**)malloc(row_size  * sizeof(int*));
	for(i=0;i<row_size;i++){
		arr[i] = (int*)malloc(col * sizeof(int));
	}
	
         return arr;
}

int** sum(int** arr1,int** arr2,int** result,int row_size,int col){

	for(int i=0;i<row_size;i++){
		for(int j=0;j<col;j++){
			result[i][j]=arr1[i][j]+arr2[i][j];
		}
	}return result;
}

void deallocate(int** arr, int row_size){
	int i;
	for (i=0;i<row_size;i++)
       	   free(arr[i]);
       	free(arr);
 
}


