import 'package:easel/easel.dart';

/// the segment between two pixels;
class Segment extends Drawable with HasPrecision {
  final Pixel a;
  final Pixel b;

  Segment(this.a, this.b, [int precision = 1]) {
    changePrecision(precision);
  }
}
