import 'dart:math';

class ClosedPath {
  List<Point> _points = [];

  void moteTo(Point point) {
    _points = [point];
  }

  void lineTo(Point point) {
    _points.add(point);
  }
}

void main() {
  // square shape
  final path = ClosedPath()
    ?..moteTo(Point(0, 0))
    ..lineTo(Point(2, 0))
    ..lineTo(Point(2, 2))
    ..lineTo(Point(0, 2))
    ..lineTo(Point(0, 0));
}
