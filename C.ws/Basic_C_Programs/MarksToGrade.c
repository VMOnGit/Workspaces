#include <stdio.h>

int main()
{
    int n;
    printf("Enter Number\n");
    scanf("%d",&n);
    if(n>=75){
        printf("A\n");
    }
    else if(n>=55&&n<75){
        printf("B\n");
    }else if(n>=40&&n<55){
        printf("C\n");
    }else{
        printf("FAIL\n");
    }
    
}