import 'package:easel_example/src/drawable/drawable.dart';
import 'package:flutter/material.dart';

import '../drawable/drawables/drawables.dart';

// the 2D canvas
// canvas helper
class Easel {
  final Canvas canvas;
  final Size size;

  const Easel(this.canvas, this.size);

  void drawAll(List<Drawable> component) {
    for (Drawable drawable in component) {
      switch (drawable.runtimeType) {
        case Pixel:
          Pixel p = drawable as Pixel;
          putPixel(p);
          break;
        case Line:
          Line l = drawable as Line;
          drawLine(l);
          break;
        default:
          debugPrint('can\'t draw : unknown type: ?');
      }
      // if(drawable is Pixel){
      //   putPixel(pixel);
      // }else {

      // }
    }
  }

  /// draw one pixel
  void putPixel(Pixel pixel) {
    final p = Paint()
      ..color = pixel.color
      ..strokeWidth = 1;

    canvas.drawRect(
        size.center(Offset(pixel.x, pixel.y)) & const Size(1, 1), p);
  }

  void drawLine(Line line) {
    final p = Paint()
      ..color = line.color
      ..strokeWidth = line.thickness;

    canvas.drawLine(
        size.center(line.a.toOffset()), size.center(line.b.toOffset()), p);
  }
}
