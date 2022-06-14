import 'package:flutter/painting.dart';

// the 2D canvas
class Easel {
  final Canvas canvas;
  final Size size;

  const Easel(this.canvas, this.size);

  /// draw one pixel
  void putPixel(double x, double y, Color color) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 1;

    canvas.drawRect(size.center(Offset(x, y)) & const Size(1, 1), p);
  }
}
