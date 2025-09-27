#include "Square.h"

Square::Square() { side = 0; }
Square::Square(int a) { side = a; }

void Square::accept() {
    cout << "Enter side: ";
    cin >> side;
}

void Square::display() {
    cout << "Square side = " << side << endl;
}

float Square::area() { return side * side; }
float Square::perimeter() { return 4 * side; }
