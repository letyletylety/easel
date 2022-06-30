import 'dart:ui';

import 'package:easel/src/drawable/drawables/drawable.dart';

/// The smallest drawable with color
/// (x, y, color)
class Pixel extends ColoredDrawable with Stringer {
  final double x, y;

  Pixel(this.x, this.y, [Color color = const Color(0xFF000000)]) : super(color);

  Offset toCenteredOffset(Size size) {
    return size.center(Offset(x, -y));
  }

  @override
  String toString() {
    return "Pixel($x,$y-$color)";
  }
}
