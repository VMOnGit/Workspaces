#include <stdio.h>

void divrem(int,int,int*,int*);
int main(){
	int divident,divisor;
	int Rem,Quo;
	printf("Enter the divident and divisor:");
	scanf("%d%d",&divident,&divisor);
	divrem(divident,divisor,&Rem,&Quo);
	printf("The Quotient is %d and the Remainder is %d\n",Quo,Rem);
}
void divrem(int divident ,int divisor,int *Rem,int *Quo)
{
	*Rem=divident%divisor;
	*Quo=divident/divisor;
}
