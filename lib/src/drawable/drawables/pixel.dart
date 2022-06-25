import 'dart:ui';

import 'package:easel/src/drawable/drawables/drawable.dart';

class Pixel extends ColoredDrawable {
  final double x, y;

  Pixel(this.x, this.y, [Color color = const Color(0xFF000000)]) : super(color);
}
