#include <stdio.h>

int main() {
	int userin;
	int prod,num;
	printf("Enter number to find multi table and the max multiplicand");
	scanf("%d%d",&userin,&num);
	for(int i = 1;i<=num;i++){
	    printf("%d x %d = %d\n",userin,i,(userin*i));
	}
	

}