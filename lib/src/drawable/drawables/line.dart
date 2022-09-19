import 'dart:ui';

import 'package:easel/src/2d/area_object.dart';
import 'package:easel/src/drawable/drawables/drawable.dart';
import 'package:easel/src/easel/artwork.dart';

class Line extends ColoredDrawable with HasThickness {
  final Point a;
  final Point b;

  Line(this.a, this.b, {Color color = const Color(0xFF000000)}) : super(color);

  Line.xyxy(
    double x0,
    double y0,
    double x1,
    double y1, {
    Color color = const Color(0xFF000000),
    double thickness = 1.0,
  })  : a = Point(x0, y0),
        b = Point(x1, y1),
        super(color) {
    changeThickness(thickness);
  }

  @override
  void draw(Artwork artwork) {
    final p = Paint()
      ..color = color
      ..strokeWidth = thickness;

    final canvasSize = artwork.size;

    artwork.canvas.drawLine(
        a.toCenteredOffset(canvasSize), b.toCenteredOffset(canvasSize), p);
  }
}
