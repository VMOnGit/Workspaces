#include "String.h"
#include <string.h>

String::String()
{
	length = 0;
	name = new char[length+1];
	*name = '\0';
}

String::String(const char *nm){
	length = strlen(nm);
	name = new char[length+1];
	strcpy(name,nm);
}

void String::display(){
	cout<<"\nName :"<<name<<endl;
}

String::~String(){
	
	if(name)
		delete []name;
	
	name=NULL;
}
