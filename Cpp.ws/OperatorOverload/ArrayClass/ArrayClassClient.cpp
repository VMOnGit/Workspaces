#include "ArrayClass.h"
int main(){
  int size, index;
  cout<<"Enter the size of array: "<<endl;
  cin>>size;
  Array arr(size);
  cout<<"Inputing the array"<<endl;
  cin>>arr;
  cout<<"Outputing the values"<<endl;
  cout<<arr;
  cout<<"Extracting the Array Class object via subscript "<<"within 0 and "<< size-1<<endl;
  cin>>index;
  cout<<"The array value at "<<index<<" is: "<<endl;
  int temp=arr[index];
  if (!temp) cout<<"You have entered the wrong range in index."<<endl;
  else cout<<temp<<endl;

}
