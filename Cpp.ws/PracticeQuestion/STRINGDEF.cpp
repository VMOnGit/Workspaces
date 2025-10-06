#include "STRING.h"
#include "STRINGFNS.cpp"
//Constructors, getters and setters, destructor
STRING::STRING(){
    length = 0;
    str_ptr = new char[length+1];
    *str_ptr = '\0';
}

STRING::STRING(const char *str){
  this->length=str_len(str);
  
  this->str_ptr=new char(this->length+1); //DMA Concept
  str_cpy(str_ptr,str);
}

STRING::STRING(int length){
    this->length=length;
    this->str_ptr=new char(this->length+1);

}
STRING::STRING(const STRING&s){
  this->length=s.length;
  this->str_ptr=new char(this->length+1); //DMA Concept
  str_cpy(str_ptr,s.str_ptr);
}

STRING::STRING(int length, char* str){
    this->length=length;
    this->str_ptr=new char(this->length+1); //DMA Concept
    str_cpy(str_ptr,str);
}

STRING::~STRING(){
    char* ptr = this->str_ptr;
    if(ptr!=NULL){
        cout<<"\nDestructor invoked for "<<*ptr<<endl;
        delete []ptr;
    }
    ptr=NULL;
}

char* STRING::getStringPointer(){
  return this->str_ptr;
}

int STRING::getStringlength(){
  return this->length;
}


//Operator Overloading
STRING& STRING::operator=(STRING &a){
    if (this != &a) {
        delete[] this->str_ptr;
        this->length = a.length;
        this->str_ptr = new char[this->length + 1];
        str_cpy(this->str_ptr, a.str_ptr);
    }
    return (*this);
}

char& STRING::operator[](int index){
  if ((this->length-1)>=index&&(index>=0))
    return *(this->str_ptr+index);
  else{
    return *(this->str_ptr+this->length); //returning null character if index is out of bounds
  }
}

STRING& STRING::operator()(int index1, int index2) {
    static STRING temp;
    int length = abs(index2 - index1) + 1;
    temp.length = length;
    delete[] temp.str_ptr;
    temp.str_ptr = new char[length + 1];

    if((index2-index1)>0){
        for (int i = 0; i < length; i++) {
            temp.str_ptr[i] = this->str_ptr[i + index1];
        }
    }
    else{
        for (int i = index1; i >= index2; i--) {
            temp.str_ptr[index1 - i] = this->str_ptr[i];
        }
    }

    temp.str_ptr[length] = '\0';
    return temp;
}

STRING& STRING::operator+(const STRING &a) {
    STRING* temp = new STRING(this->length + a.length);
    str_cpy(temp->str_ptr, this->str_ptr);
    str_cat(temp->str_ptr, a.str_ptr);
    temp->length = str_len(temp->str_ptr);
    return *temp;
}

bool STRING::operator==(STRING &a){
    return str_cmp(this->str_ptr,a.str_ptr)==0;
}

bool STRING::operator<(STRING &a){
    return str_cmp(this->str_ptr,a.str_ptr)<0;
}

bool STRING::operator>(STRING &a){
    return str_cmp(this->str_ptr,a.str_ptr)>0;
}

ostream& operator<<(ostream& out, STRING& s){
    out<<s.str_ptr;
    return out;
}

istream& operator>>(istream& in, STRING& s){
    char temp[100];
    in>>temp;
    s.length = str_len(temp);
    delete[] s.str_ptr;
    s.str_ptr = new char[s.length + 1];
    str_cpy(s.str_ptr, temp);
    return in;
}
