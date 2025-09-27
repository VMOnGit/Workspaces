#include<stdio.h>
int main()
{
int i,j;
int num=2,count=0;

while(count<20){
	j=0;
	for(i=2;i<num;i++){
		if(num%i==0){
			j=1;
			break;
		}
	}if(j==0){
		printf("%d\n",num);
		count++;
	}num++;
}
  }
  


