#pragma once
#include "Shape.h"

class Circle : public Shape {
private:
    int radius;
public:
    Circle();
    Circle(int);

    void accept();
    void display();
    float area();
    float perimeter();
};
