import 'dart:math';

abstract class Shape {
  double get area;
}

class Square extends Shape {
  Square(this.side);

  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}

void main() {
  // 注意：父类可以接替子类的位置 -> 站岗
  final Shape shape = Square(10);
  print(shape.area);

  final Shape circel = Circle(5);
  print(circel.area);

  // 要开始了
  final shapes = [
    Square(2),
    Circle(3)
  ];

  print('----------');

  shapes.forEach(printArea);
}
