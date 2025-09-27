#include <stdio.h>
#define CHALPHA(n) ((n>=65 && n<91)||(n>=97 && n<123))

int main(){
	int res;
	char n;
	printf("Enter character to check:");
	scanf("%c",&n);
	res= CHALPHA(n);
	if(res)
		printf("Valid\n");
	else
		printf("Invalid\n");
	return 0;
}
