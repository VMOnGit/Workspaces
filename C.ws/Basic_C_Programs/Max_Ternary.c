#include <stdio.h>

int main() {
	int a;
  int b;
  int out;
	printf("Enter Number\n");
	scanf("%d",&a);

	printf("Enter Number\n");
	scanf("%d",&b);
    out=(a>b)?a:b;
    printf("Max is :%d",out);
}