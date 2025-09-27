#pragma once
#include "Shape.h"

class Square : public Shape {
private:
    int side;
public:
    Square();
    Square(int);

    void accept();
    void display();
    float area();
    float perimeter();
};
