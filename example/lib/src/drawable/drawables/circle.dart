import 'dart:ui';

import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawable.dart';

class Circle extends ColoredDrawable {
  final Point center;
  final double radius;

  Circle(this.center, this.radius, {Color color = ColoredDrawable.black})
      : super(color);

  Circle.xyr(double x, double y, this.radius,
      {Color color = ColoredDrawable.black})
      : center = Point(x, y),
        super(color);
}
