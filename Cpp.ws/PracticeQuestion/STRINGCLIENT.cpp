#include "STRING.h"

int main(){
    int choice;
    while(true)
    {
    cout<<"Enter you choice:\n\
    1. String Concatenation\n\
    2. String Comparison\n\
    3. String Copy\n\
    4. String Length\n\
    5. Select range of string\n\
    6. Exit"<<endl;
    cin>>choice;

    switch(choice){
            case 1:{
                STRING str1, str2;
                cout<<"Enter first string: "<<endl;
                cin>>str1;
                cout<<"Enter second string: "<<endl;
                cin>>str2;
                cout<<"The concatenated string is: "<<(str1+str2)<<endl;
                break;
            }
            case 2:{
                STRING str1, str2;
                cout<<"Enter first string: "<<endl;
                cin>>str1;
                cout<<"Enter second string: "<<endl;
                cin>>str2;
                if(str1==str2){
                    cout<<"Strings are equal"<<endl;
                }
                else if(str1<str2){
                    cout<<"First string is less than second string"<<endl;
                }
                else{
                    cout<<"First string is greater than second string"<<endl;
                }
                break;
            }
            case 3:{
                STRING str1, str2;
                cout<<"Enter first string: "<<endl;
                cin>>str1;
                str2 = str1;
                cout<<"The copied string is: "<<str2<<endl;
                break;
            }
            case 4:{
                STRING str1;
                cout<<"Enter a string: "<<endl;
                cin>>str1;
                cout<<"The length of the string is: "<<str1.getStringlength()<<endl;
                break;
            }
            case 5:{
                STRING str1;
                int index1, index2;
                cout<<"Enter a string: ";
                cin>>str1;
                cout<<"Enter starting and ending index: ";
                cin>>index1>>index2;
                cout<<"The selected range of string is: "<<str1(index1,index2)<<endl;
                break;
            }   
            case 6:{
                return 0;

            }
            default:{
                cout<<"Invalid choice"<<endl;
                break;
            }
        }
    }
}