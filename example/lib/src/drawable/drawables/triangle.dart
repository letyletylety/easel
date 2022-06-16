import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawable.dart';
import 'package:flutter/material.dart';

// the concept class
/// this is [Drawable] but abstract
abstract class Triangle extends ColoredDrawable {
  final Point a;
  final Point b;
  final Point c;

  Triangle(this.a, this.b, this.c, {Color color = const Color(0xFF000000)})
      : super(color);

  Triangle.xyxyxy(
      double x0, double y0, double x1, double y1, double x2, double y2,
      {Color color = ColoredDrawable.black})
      : a = Point(x0, y0),
        b = Point(x1, y1),
        c = Point(x2, y2),
        super(color);
}

/// wireframe
/// not filled triangle
class WireFrameTriangle extends Triangle with HasThickness {
  WireFrameTriangle(super.a, super.b, super.c,
      {super.color = ColoredDrawable.black, double thickness = 1.0}) {
    changeThickness(thickness);
  }
  WireFrameTriangle.xyxyxy(
      double x0, double y0, double x1, double y1, double x2, double y2,
      {Color color = ColoredDrawable.black, double thickness = 1.0})
      : super.xyxyxy(x0, y0, x1, y1, x2, y2, color: color) {
    changeThickness(thickness);
  }
}
