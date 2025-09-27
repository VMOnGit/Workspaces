#include <iostream>
using namespace std;

int main(){
	int size,i;
	float average=0,sum=0;
	int *ptr;
	cout<<"\nEnter the size\n";
	cin>> size;
	ptr = new int[size];
	cout<<"\nEnter"<<size<<"values"<<endl;
	for(i=0;i<size;i++)
		cin>>ptr[i];
	
	
	for(i=0;i<size;i++)
		sum=sum+ptr[i];
	
	average = sum/size;
	cout<<"The Sum is"<<sum<<endl<<"The average is"<<average<<endl;
	delete []ptr;
	return 0;
}
