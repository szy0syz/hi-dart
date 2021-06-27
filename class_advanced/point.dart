import 'package:equatable/equatable.dart';

class Point extends Equatable {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  @override
  bool get stringify => true;

  @override
  bool operator ==(covariant Point other) {
    return x == other.x && y == other.y;
  }

  @override
  // ignore: override_on_non_overriding_member
  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  @override
  // ignore: override_on_non_overriding_member
  Point operator *(int other) {
    return Point(x + other, y + other);
  }
}

void main() {
  print(Point(1, 1) == Point(1, 1));
  print(Point(0, 0));
}



// class Point {
//   Point(this.x, this.y);

//   final int x;
//   final int y;

//   @override
//   String toString() {
//     return "Point($x, $y)";
//   }

//   @override
//   bool operator == (covariant Point other) {
//     // if (other is Point) {
//     //   return x == other.x && y == other.y;
//     // }
//     return x == other.x && y == other.y;

//     // return false;
//   }
// }

// void main() {
//   print(Point(1, 2) == Point(1, 2));
//   // print(Point(1, 2) == 'a1');
// }
