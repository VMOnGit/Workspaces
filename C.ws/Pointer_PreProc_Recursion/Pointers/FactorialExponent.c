#include <stdio.h>

void fact(int,int*);
void powe(int,int,int*);
int main()
{
	int num,exp;
	int fac=1,po=1;
	printf("Enter the Number for factorial and Exponent");
	scanf("%d %d",&num,&exp);
	fact(num,&fac);
	powe(num,exp,&po);
	printf("Factorial and Exponent is %d\t%d\n",fac,po);
	return 0;
}

void fact(int num,int *fac)
{
	while(num>0){
		*fac=*fac*num;
		num=num-1;
	}
}
void powe(int num ,int exp ,int *po)
{
 	for(int i = 1;i<=exp;i++){
 		*po = num*(*po);
 	}
}
