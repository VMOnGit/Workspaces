#include "Array.h"
int main(){
  int size, index,index_2=2;
  cout<<"Enter the size of array: "<<endl;
  cin>>size;
  Array arr(size);
  Array brr(size);
  Array crr(size);
  cout<<"Enter the first array"<<endl;
  cin>>arr;
  cout<<"Enter the second array"<<endl;
  cin>>brr;
  cout<<"Displaying values"<<endl;
  cout<<arr<<endl;
  cout<<brr<<endl;
  crr = arr+brr;
  cout<<crr;
  crr[index_2] = 200;
  cout<<crr;
  cout<<"The sum:"<<endl;
  cout<<arr;
  cout<<"Extracting the Array object via subscript "<<"within 0 and "<< 				size-1<<endl;
  cin>>index;
  cout<<"The array value at "<<index<<" is: "<<endl;
  int temp=arr[index];
  if (!temp) cout<<"Entered the wrong range in index."<<endl;
  else cout<<temp<<endl;
  
 
}
