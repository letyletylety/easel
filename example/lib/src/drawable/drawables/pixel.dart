import 'dart:ui';

import 'package:easel_example/src/drawable/drawable.dart';

class Pixel extends ColoredDrawable {
  final double x, y;

  Pixel(this.x, this.y, [Color color = const Color(0xFF000000)]) : super(color);
}
