import 'package:easel/easel.dart';

/// 3 pixel triangle
class Trigon extends Drawable {
  final Pixel a;
  final Pixel b;
  final Pixel c;

  Trigon(this.a, this.b, this.c);

  /// a always have the smallest y
  Trigon sort() {
    if (a.y <= b.y) {
      //ok
      if (a.y <= c.y) {
        // ok; (a is the smallest)
        return this;
      } else {
        // c is smaller
        return Trigon(c, a, b);
      }
    } else {
      // b is smaller
      if (b.y <= c.y) {
        // b is the smallest
        return Trigon(b, a, c);
      } else {
        // c is the smallest
        return Trigon(c, a, b);
      }
    }
  }

  @override
  void draw(Artwork artwork) {
    // TODO: implement draw
  }
}
