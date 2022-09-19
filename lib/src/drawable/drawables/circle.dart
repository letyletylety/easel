import 'dart:ui';

import 'package:easel/src/2d/area_object.dart';
import 'package:easel/src/drawable/drawables/drawable.dart';
import 'package:easel/src/easel/artwork.dart';

class Circle extends ColoredDrawable {
  final Point center;
  final double radius;

  Circle(this.center, this.radius, {Color color = ColoredDrawable.black})
      : super(color);

  Circle.xyr(double x, double y, this.radius,
      {Color color = ColoredDrawable.black})
      : center = Point(x, y),
        super(color);

  @override
  void draw(Artwork artwork) {
    final p = Paint()..color = color;

    final co = center.toCenteredOffset(artwork.size);

    artwork.canvas.drawCircle(co, radius, p);
  }
}
