import 'package:easel_example/src/drawable/drawable.dart';

class Pixel extends ColoredDrawable {
  final double x, y;

  Pixel(this.x, this.y, color) : super(color);
}
