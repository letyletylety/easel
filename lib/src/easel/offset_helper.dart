import 'dart:ui';

extension OffsetHelper on Offset {
  static Offset fromPoint(Size size, double x, double y) {
    return size.center(Offset(x, -y));
  }
}
