class Point {
  Point(this.x, this.y);

  final int x;
  final int y;

  @override
  String toString() {
    return "Point($x, $y)";
  }

  @override
  bool operator == (covariant Point other) {
    // if (other is Point) {
    //   return x == other.x && y == other.y;
    // }
    return x == other.x && y == other.y;

    // return false;
  }
}

void main() {
  print(Point(1, 2) == Point(1, 2));
  // print(Point(1, 2) == 'a1');
}
