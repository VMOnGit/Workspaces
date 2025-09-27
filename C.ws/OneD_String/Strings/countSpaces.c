#include<stdio.h>

int countSpace(char *str)
{ 
  int count = 0;
  for(int i =0;str[i]!='\0';i++){
    if(str[i]==' '){
      count++;
    }
  }
  printf("There are %d spaces\n",count);
}



int main()
{
  char str[20];
  fgets(str,20,stdin);
  countSpace(str);
  return 0;
  
}
