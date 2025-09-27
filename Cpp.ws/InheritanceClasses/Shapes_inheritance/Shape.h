#pragma once
#include <iostream>
using namespace std;

class Shape {
    protected:
        float Area=0;
        float Perimeter=0;
public:
    virtual void accept() = 0;       // pure virtual
    virtual void display() = 0;
    virtual float area() = 0;
    virtual float perimeter() = 0;
    virtual ~Shape() {}
};
