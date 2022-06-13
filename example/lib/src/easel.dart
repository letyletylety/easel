import 'package:flutter/painting.dart';

class Easel {
  final Canvas canvas;
  final Size size;

  const Easel(this.canvas, this.size);

  /// draw one pixel
  void putPixel(double y, double x, Color color) {
    final p = Paint()..color = color;

    canvas.drawRect(Rect.fromLTWH(x, y, 1, 1), p);
  }
}
