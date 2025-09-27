#include "String.h"
int main(){
String s1,s2("Hello");
s1 = s2;
cout<<s1;
String s3 = s2;
cout<<s3;
if(!(s3==s2))
  cout<<"Strings are equal"<<endl;
else
  cout<<"Strings are not equal"<<endl;
s1 = s2+s3;
cout<<s1<<endl;
cout<<s1(3,7)<<endl;
cout<<s1[2]<<endl;
s1[2] = 'p';
cout<<s1<<endl;
return 0;
}
