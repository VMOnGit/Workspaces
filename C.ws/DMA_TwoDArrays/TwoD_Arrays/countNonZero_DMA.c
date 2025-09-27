
#include<stdio.h>
#include<stdlib.h>
int** allocate(int**,int,int);
int** deallocate(int**,int,int);
int** accept(int**,int, int);
int countNZ(int**,int,int);
void display(int**,int,int);

int main(){
  int** m1=NULL;//**a=NULL;
  int row_size,col_size,countNon;
  printf("Enter the row size of the matrix you want.");
  scanf("%d",&row_size);
  printf("Enter the column size of the matrix you want.");
  scanf("%d",&col_size);
  m1=allocate(m1,row_size,col_size);
  //m2=allocate(m2,row_size,col_size);
  //a=allocate(m2,row_size,col_size);
  
  m1=accept(m1,row_size,col_size);
  display(m1,row_size,col_size);
  //m2=accept(m2,row_size,col_size);
  //display(m2,row_size,col_size);
  countNon=countNZ(m1, row_size,col_size);
  printf("----Count of Non Zero Elements in the Sparse Matrix is:---->\n");
  printf("%d",countNon);
  
  deallocate(m1,row_size,col_size);
  return 0;
}

int** allocate(int** m, int row_size, int col_size){
  int i;
  m = (int**)malloc(row_size*sizeof(int*));
  for(i=0;i<row_size;i++){
    m[i]=(int*)malloc(col_size*sizeof(int));
  }
  return m;
}

int** accept(int** m, int row_size, int col_size){
  int i,j;
  printf("Enter the elements in Matrix\n");
  for(i=0;i<row_size;i++){
    for(j=0;j<col_size;j++){
      scanf("%d",&m[i][j]);
    }
  }
  return m;
}

int countNZ(int** m1, int row_size, int col_size){
  int i,j,countNon=0;
  for(i=0;i<row_size;i++){
    for(j=0;j<col_size;j++){
      if(m1[i][j]!=0){
        countNon+=1;
      }
    }
  }
  return countNon;
}

void display(int** m, int row_size, int col_size){
  int i,j;
  printf("\n-------------\n");
  for(i=0;i<row_size;i++){
    for(j=0;j<col_size;j++){
      printf("%d\t",m[i][j]);
    }
    printf("\n");
  }
}

int** deallocate(int** m, int row_size, int col_size){
  int i,j;
  m = (int**)malloc(row_size*sizeof(int*));
  for(i=0;i<row_size;i++){
    m[i]=(int*)malloc(col_size*sizeof(int));
  }
  //Accepting values
  for(i=0;i<row_size;i++){
    free(m[i]);
    m[i]=NULL;
  }
  return m;
}
