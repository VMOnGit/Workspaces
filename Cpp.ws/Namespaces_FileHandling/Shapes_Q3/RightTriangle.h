#pragma once
#include "Triangle.h"
#include <cmath>

class RightTriangle : public Triangle {
public:
    RightTriangle(int base, int height)
        : Triangle(base, height, std::sqrt(base*base + height*height)) {}
};
