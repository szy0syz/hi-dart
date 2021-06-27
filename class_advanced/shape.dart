import 'dart:math';

abstract class Shape {
  double get area;
  const Shape();

  // 这里最好写Object，比写 dynamic 好
  // 两种写法，factory 很学术，但 staic 更好理解
  // factory Shape.fromJson(Map<String, Object> json) {
  static Shape fromJson(Map<String, Object> json) {
    final type = json['type'];

    switch (type) {
      case 'square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        }
        throw UnsupportedError('invalid or missing side property');
      case 'circle':
        final radius = json['radius'];
        if (radius is double) {
          return Square(radius);
        }
        throw UnsupportedError('invalid or missing side property');
      default:
        throw UnimplementedError('shape $type not recognized');
    }
  }
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
  final shapesJson = [
    {"type": "square", "side": 10.0},
    {"type": "circle", "radius": 5.0},
    {"type": "triangle"}
  ];

  try {
    final shapes = shapesJson.map((shapeJson) => Shape.fromJson(shapeJson));
    print(shapes);
    shapes.forEach(printArea);
  } catch (e) {
    print(e);
  }
}
