#pragma once
#include "Shape.h"

class Triangle : public Shape {
protected:
    int a, b, c; // three sides
public:
    Triangle();
    Triangle(int, int, int);

    void accept();
    void display();
    float area();
    float perimeter();
};
