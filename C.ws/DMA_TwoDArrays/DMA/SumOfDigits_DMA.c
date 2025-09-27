#include<stdio.h>
#include<stdlib.h>

void sum(int *,int );

int main()
{
	int count;
	printf("Enter the number of inputs:");
	scanf("%d",&count);
	
	int(*arr)=(int*)malloc(count*sizeof(int*));
	for(int i=0;i<count;i++)
	{       
	       
		printf("Enter the number");
		scanf("%d",&arr[i]);
	} 
	
	sum(arr,count);
	
	return 0;
}	
	
	
void sum(int *arr,int count)
	{ int rem=0,i,sum_digits[count],sum=0;
	  
		for(int i=0;i<count;i++)
		{
		sum=0;
		rem=0;
		while(arr[i]!=0)
			{
				rem=arr[i]%10;
				sum=sum+rem;
				arr[i]=arr[i]/10;		
			}
			sum_digits[i]=sum;
			printf("%d\n",sum);
		}
	}
	
	
