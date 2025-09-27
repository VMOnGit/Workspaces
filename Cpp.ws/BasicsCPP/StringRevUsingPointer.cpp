#include<iostream>
using namespace std;
int main()
{ 
  char str[20];
  char *ptr=NULL;
  ptr = str;
  cout<<"Enter string to reverse:";
  cin>>str;
  int n,i = 0,j = 0;
  while (str[i] != '\0')
      i++;  
  // Copy characters from str2 to str1 
  n=i;
  i--;
  while(j<(n/2)){
    str[j]=str[j]^ptr[i];
    ptr[i]=str[j]^ptr[i];
    str[j]=str[j]^ptr[i];
    j++;
    i--;
  }
     
           
    


  cout<<"The reversed string is:"<<ptr<<endl;
  
 }
 

