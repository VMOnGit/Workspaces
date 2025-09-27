
#include "Circle.h"
#include "Square.h"
#include "Triangle.h"
#include "RightTriangle.h"
#include "EquilateralTriangle.h"

using namespace std;

int main() {
    Shape* s = nullptr;
    int choice;

    do {
        cout << "\
				1. Circle\n \
				2. Square\n  \
				3. Triangle\n\
				4. Right Triangle\n\
				5. Equilateral Triangle\n\
				0. Exit\n";
		cout<<"Enter your choice: ";
        cin >> choice;

        switch (choice) {
        case 1: {
            int r;
            cout << "Enter radius: ";
            cin >> r;
            s = new Circle(r);
            break;
        }
        case 2: {
            int side;
            cout << "Enter side: ";
            cin >> side;
            s = new Square(side);
            break;
        }
        case 3: {
            int a, b, c;
            cout << "Enter three sides: ";
            cin >> a >> b >> c;
            s = new Triangle(a, b, c);
            break;
        }
        case 4: {
            int base, height;
            cout << "Enter base and height: ";
            cin >> base >> height;
            s = new RightTriangle(base, height);
            break;
        }
        case 5: {
            int side;
            cout << "Enter side: ";
            cin >> side;
            s = new EquilateralTriangle(side);
            break;
        }
        case 0:
            cout << "Exiting...\n";
            break;
        default:
            cout << "Invalid choice. Try again.\n";
        }

        if (s != nullptr) {
            s->display();
            cout << "Area = " << s->area()
                 << ", Perimeter = " << s->perimeter() << endl;
            delete s;
            s = nullptr;
        }

    } while (choice != 0);

    return 0;
}
