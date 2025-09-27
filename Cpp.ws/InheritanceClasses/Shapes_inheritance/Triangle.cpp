#include "Triangle.h"
#include <cmath>

Triangle::Triangle() { a = b = c = 0; }
Triangle::Triangle(int x, int y, int z) { a = x; b = y; c = z; }

void Triangle::accept() {
    cout << "Enter 3 sides: ";
    cin >> a >> b >> c;
}

void Triangle::display() {
    cout << "Triangle sides = " << a << ", " << b << ", " << c << endl;
}

float Triangle::area() {
    float s = (a + b + c) / 2.0;
    return sqrt(s * (s - a) * (s - b) * (s - c)); // Heron’s formula
}

float Triangle::perimeter() { return a + b + c; }
