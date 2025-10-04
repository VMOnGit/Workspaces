#include <iostream>
#include <cmath>
using namespace std;

class STRING{
    char *str_ptr;
    int length = 0;
    public:
        STRING();               //default constructor
        STRING(const char *);   //parameterized constructor
        STRING(int ,char*);
        STRING(const STRING&);  //copy constructor
        STRING(int);            //temp variable constructor
        ~STRING();              //destructor
        //op overloading, input output needs to be friend function
        friend ostream& operator<<(ostream&, STRING&);
        friend istream& operator>>(istream&, STRING&);
        
        char& operator[](int);
        bool operator==(STRING &);
        bool operator<(STRING &);
        bool operator>(STRING &);
        STRING& operator()(int ,int );
        STRING& operator=(STRING&);
        STRING& operator+(const STRING &);
        char* getStringPointer();
        int getStringlength();
};