#include<stdio.h>
void accept(int*);
void check(int*, int*);
void display(int[]);

int main()
{               
 	int arr[5], prime[5];
 	accept(arr);
 	check(arr, prime);
 	display(prime);
 	return 0;
 }
 
void accept(int*arr)
{
	for(int i =0;i<5;i++)
	{
 		printf("Enter %d th element of array",i+1);
 		scanf("%d",&arr[i]);
 	}
}

void check(int *arr, int *prime)
{	
	
	for(int i=0;i<5;i++)
	{
	
	    int j=0;
	    for(int k=2;k<(arr[i]);k++)
	    {
		if(arr[i]%k==0){
			j=1;
			break;
		}
	    }
	    
		if(j==0)
		{
			prime[i] = arr[i];
		}
		else {
		     prime[i]=0;
		}
	}
}
void display(int prime[])
{
	for(int i=0;i<5;i++)
	{
		if(prime[i] != 0){
		printf("Prime numbers are %d\n",prime[i]);
	}
	}
}
