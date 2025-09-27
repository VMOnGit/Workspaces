#include<stdio.h>
void display(int* ,int*);
int main()
{ 
 	int rev[10];
 	int arr[10];
 	for(int i =0;i<10;i++){
 		printf("Enter %d th element of array",i+1);
 		scanf("%d",&arr[i]);
 	}
 	display(arr,rev);
 	return 0;
 }
 void display(int *rev,int *arr)
 
{
 	for(int i =0;i<10;i++)
 	{
 		rev[i]=arr[9-i];
 		printf("%d",rev[i]);
 	}
 	
}
