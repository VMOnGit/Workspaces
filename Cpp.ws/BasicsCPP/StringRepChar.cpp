#include<iostream>
using namespace std;
void repchar(char='*',int=5);
int main(){
    char rep;
    int num;
    cout<<"Enter character to replicate:"<<endl;
    cin>>rep>>num;
    cout<<"No parameters"<<endl;
    repchar();
    cout<<"Char parameter"<<endl;
    repchar(rep);
    cout<<"Int parameter"<<endl;
    repchar(num);
    cout<<"Char and Int parameters"<<endl;
    repchar(rep,num);
}

void repchar(char rep,int num){
    int i;
    for(i=0;i<num;i++){
        cout<<rep<<"\t";
    }cout<<endl;
}