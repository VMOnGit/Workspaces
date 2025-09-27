#include "Circle.h"
#include <cmath>

Circle::Circle() { radius = 0; }
Circle::Circle(int r) { radius = r; }

void Circle::accept() {
    cout << "Enter radius: ";
    cin >> radius;
}

void Circle::display() {
    cout << "Circle radius = " << radius << endl;
}

float Circle::area() {
    return 3.14 * radius * radius;
}

float Circle::perimeter() {
    return 2 * 3.14 * radius;
}
