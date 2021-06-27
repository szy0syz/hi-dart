import 'dart:math';

abstract class Shape {
  double get area;
  double get primeter;

  void printValues() {
    print('area: $area, perimeter: $primeter');
  }
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;

  @override
  double get primeter => side * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;

  @override
  double get primeter => 2 * pi * radius;
}

void main() {
  final shapes = [
    Square(3),
    Circle(4)
  ];

  shapes.forEach((shape) => shape.printValues());
}
