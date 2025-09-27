#include<iostream>
#include<cstring>

using namespace std;

class String{
  char *str_ptr;
  int length = 0;
  
  public:
  	String();
    String(const char *);
    String(int ,char*);
    String(const String&);
    String(int);
    ~String();
    friend ostream& operator<<(ostream&, String&);
    friend istream& operator>>(istream&, String&);
    

    char& operator[](int);

    bool operator==(String &);

    bool operator<(String &);
    
    bool operator>(String &);
    
    String& operator()(int ,int );
    
    String& operator=(String&);
    
    String& operator+(const String &);
    
    char* getStringPointer();
    int getStringlength();
    
    
  
};

