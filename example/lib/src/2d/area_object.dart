import 'dart:ui';

import 'package:vector_math/vector_math.dart';

class Point {
  late Vector2 v;

  Point(double x, double y) {
    v = Vector2(x, y);
  }

  double get x => v.x;
  double get y => v.y;

  Offset toOffset() {
    return Offset(x, y);
  }
}
