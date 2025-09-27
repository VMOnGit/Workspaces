#include <iostream>
using namespace std;

int** accept(int **,int ,int);
void display(int **,int,int);
int** allocate(int **,int ,int );
void deallocate(int **, int );


int main(){
	int **arr1=NULL;
	int col,row_size;
	cout<<"Enter col size and row size: ";
	cin>>col>>row_size;
	
	arr1 = allocate(arr1,col,row_size);

	arr1=accept(arr1,row_size,col);
	display(arr1,row_size,col);	
	
	deallocate(arr1,row_size);

	
	
}
   
   


void display(int **arr,int row_size,int col){
	int i,j;
	cout<<"\nValues:: \n";
       for(i=0;i<row_size;i++)
	{	
		for(j=0;j<col;j++)
		{
			cout<<arr[i][j]<<"\t";
		}cout<<"\n";
         }
}

int** accept(int** arr,int row_size,int col){
	int i,j;
	cout<<"Enter elements in Matrix"<<endl;
	for(i=0;i<row_size;i++)
	{	
		for(j=0;j<col;j++)
		{
			cin>>arr[i][j];
		}
    }
    return arr;
         
}
int** allocate(int** arr,int row_size,int col){
	int i;
	arr=new int*[row_size];
	for(i=0;i<row_size;i++){
		arr[i] = new int[col];
	}
	
    return arr;
}


void deallocate(int** arr, int row_size){
	for (int i = 0; i < row_size; i++)
      	delete[] arr[i];
    delete[] arr;
 
}


