#include "String.h"

String::String(){
	length = 0;
	str_ptr = new char[length+1];
	*str_ptr = '\0';
}

String::String(const char *str){
  this->length=strlen(str);
  this->str_ptr=new char(this->length+1); //DMA Concept
  strcpy(str_ptr,str);
}

String::String(int length){
	this->str_ptr=new char(this->length+1);

}

String::String(const String&s){
  this->length=s.length;
  this->str_ptr=new char(this->length+1); //DMA Concept
  strcpy(str_ptr,s.str_ptr);
}

char* String::getStringPointer(){
  return this->str_ptr;
}

int String::getStringlength(){
  return this->length;
}

String& String::operator=(String &a){
	if (this != &a) {
		delete[] this->str_ptr;
		this->length = a.length;
		this->str_ptr = new char[this->length + 1];
		strcpy(this->str_ptr, a.str_ptr);
	}
	return (*this);
}

char& String::operator[](int index){
  if ((this->length-1)>=index&&(index>=0))
    return *(this->str_ptr+index);
  else{
  	char ch = 'e';
    return ch;
  }
}

String& String::operator()(int index1, int index2) {
	static String temp;
	int length = index2 - index1 + 1;
	delete[] temp.str_ptr;
	temp.str_ptr = new char[length + 1];
	for (int i = 0; i < length; i++) {
		temp.str_ptr[i] = this->str_ptr[i + index1];
	}
	temp.str_ptr[length] = '\0';
	temp.length = length;
	return temp;
}

String& String::operator+(const String &a) {
	String* temp = new String(this->length + a.length);
	strcpy(temp->str_ptr, this->str_ptr);
	strcat(temp->str_ptr, a.str_ptr);
	temp->length = strlen(temp->str_ptr);
	return *temp;
}

bool String::operator==(String &a){
	return strcmp(this->str_ptr,a.str_ptr);
}

bool String::operator<(String &a){
	if(strlen(this->str_ptr)<strlen(a.str_ptr))
		return 1;
	else
		return 0;
}

bool String::operator>(String &a){
	if(strlen(this->str_ptr)>strlen(a.str_ptr))
		return 1;
	else
		return 0;
}

istream& operator>>(istream& i, String& str_ptr){
  short k;
  char* ptr= str_ptr.getStringPointer();
  for(k=0;k<str_ptr.getStringlength();k++){
    i>>*(ptr+k);
  }
  return i;
}

ostream& operator<<(ostream& o, String& str_ptr){
  short k;
  char* ptr=str_ptr.getStringPointer();
  for(k=0;k<str_ptr.getStringlength();k++){
    o<<*(ptr+k);
  }
  o<<endl;
  return o;
}


String::~String()
{
	char* ptr = this->str_ptr;
	if(ptr!=NULL)
	{
	cout<<"\nDestructo invoked for"<<*ptr<<endl;
	delete []ptr;
	}
	ptr=NULL;
}




