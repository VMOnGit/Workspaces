#include<stdio.h>

int countSpace(char *str)
{ 
  int count = 0;
  for(int i =0;str[i]!='\0';i++){
  char c = str[i];
  
    if(("%d",c)<91 && ("%d",c)>=65){
      str[i]=("%c",(("%d",c)+32));
    }else if(("%d",c)<123 && ("%d",c)>=97){
      str[i]=("%c",(("%d",c)-32));
    }
  }printf("There toggled string is %s\n",str);
  
}



int main()
{
  char str[20];
  fgets(str,20,stdin);
  countSpace(str);
  return 0;
  
}
