import 'package:easel/easel.dart';

/// the segment between two pixels;
///
/// if both the positions of two pixels same,
/// then just draw the pixel a only;
class Segment extends Drawable with HasPrecision, Stringer {
  final Pixel a;
  final Pixel b;

  Segment(this.a, this.b, {int precision = 10}) {
    changePrecision(precision);
  }

  @override
  String toString() {
    return "segment: $a $b";
  }

  @override
  void draw(Artwork artwork) {}
}
