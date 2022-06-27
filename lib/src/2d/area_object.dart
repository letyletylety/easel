import 'dart:ui';

import 'package:vector_math/vector_math.dart';

class Point {
  late Vector2 v;

  Point(double x, double y) {
    v = Vector2(x, y);
  }

  double get x => v.x;
  double get y => v.y;

  Point operator +(Offset d) {
    return Point(x + d.dx, y + d.dy);
  }

  Offset toOffset() {
    return Offset(x, -y);
  }

  /// convert Point to offset in the x-y Cartesian coordinate system
  Offset toCenteredOffset(Size size) {
    return size.center(Offset(x, -y));
  }
}
