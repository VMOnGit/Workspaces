#include<stdio.h>

int len()
{ 
  char str[20];
  printf("Enter string to check length:\n");
  fgets(str,20,stdin);
  int count = 0;
  
  for(int i=0;str[i]!='\0';i++){
    count+=1;
  }
  printf("Length is %d\n",count-1);
  return count;
  
}

void cpy(){

  int i = 0;
  char str[20];
  char str1[20];
  printf("Enter 1st string:");
  fgets(str,20,stdin);
  printf("Enter string to copy:");
  fgets(str1,20,stdin);
  while(str1[i]!='\0'){
    str[i]=str1[i];
    i++;
  }
  
  printf("%s",str);
}


char cat(){
  int i = 0;
  char str[20];
  char str1[20];
  printf("Enter 1st string:");
  fgets(str,20,stdin);
  printf("Enter string to concatenate:");
  fgets(str1,20,stdin);
  // Move to the end of str1
  while (str[i] != '\0')
      i++;  
  // Copy characters from str2 to str1
  int j = 0;  
  i--;
  while (str1[j] != '\n') {      
      str[i] = str1[j];        
      i++;
      j++;
    }
  str[i] = '\0';
  printf("Concatenated string is %s\n",str);
}

char rev(){
  char str[20];
  char rev[20];
  printf("Enter string to reverse:");
  fgets(str,20,stdin);
  int n,i = 0,j = 0;
  while (str[i] != '\0')
      i++;  
  // Copy characters from str2 to str1 
 
 n=i;
 i--;
  while (str[j] != '\0') {      
      rev[j] = str[i];        
      i--;
      j++;
    }
  rev[n] = '\0';
  printf("The reversed string is:%s\n",rev);
  }
  
char compare(){
  char str[20];
  char str1[20];
  printf("Enter 1st string:");
  fgets(str,20,stdin);
  printf("Enter string to compare:");
  fgets(str1,20,stdin);
   int i = 0;
    while (str[i] == str1[i]) {
        if (str[i] == '\0' && str1[i] == '\0') break;
        i++;
    }
    if((str[i] - str1[i])==0){
      printf("Identical\n");
    }else{
      printf("Different\n");
    }

}
int main()
{ 
  char userin[4];
  int user;
  while(1){
  printf("Enter a number to choose operation\n 1. For length of string\n 2.For string copying\n 3. for concatination string\n 4. For reverse\n 5 for comparison\n 6 to quit\n");
  
  fgets(userin,4,stdin);
  sscanf(userin,"%d",&user);
  
  switch(user){
    case 1:
      int i = len();
      break;
    case 2:
      cpy();
      break;
    case 3:
      cat();
      break;
    case 4:
      rev();
      break;
    case 5:
      compare();
    default:
      printf("Invalid Input\n");
      break;
  }
  if(user==6)
    break;
  }
}
