import 'package:easel/easel.dart';

/// the segment between two pixels;
class Segment extends Drawable {
  final Pixel a;
  final Pixel b;

  Segment(this.a, this.b);
}
