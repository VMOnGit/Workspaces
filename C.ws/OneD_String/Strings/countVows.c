#include<stdio.h>

int countSpace(char *str)
{ 
  
  int arr[10]={0,0,0,0,0,0,0,0,0,0};
  for(int i =0;str[i]!='\0';i++){
    char c =str[i];
    if(c=='A'){
      arr[5]+=1;
    }else if(c=='E'){
      arr[6]+=1;
    }else if(c=='I'){
      arr[7]+=1;
    }else if(c=='O'){
      arr[8]+=1;
    }else if(c=='U'){
      arr[9]+=1;
    }else if(c=='a'){
      arr[0]+=1;
    }else if(c=='e'){
      arr[1]+=1;
    }else if(c=='i'){
      arr[2]+=1;
    }else if(c=='o'){
      arr[3]+=1;
    }else if(c=='u'){
      arr[4]+=1;
    }
  }
  printf("A\t%d\ta\t%d\nE\t%d\te\t%d\nI\t%d\ti\t%d\nO\t%d\to\t%d\nU\t%d\tu\t%d\n",arr[0],arr[5],arr[1],arr[6],arr[2],arr[7],arr[3],arr[8],arr[4],arr[9]);
}



int main()
{
  char str[20];
  fgets(str,20,stdin);
  countSpace(str);
  return 0;
  
}
