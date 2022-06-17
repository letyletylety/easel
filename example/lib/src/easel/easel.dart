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
        case WireFrameTriangle:
          WireFrameTriangle wt = drawable as WireFrameTriangle;
          drawWireframeTriangle(wt);
          break;
        case FilledTriangle:
          FilledTriangle ft = drawable as FilledTriangle;
          drawFilledTriangle(ft);
          break;
        case ShadedTriangle:
          ShadedTriangle st = drawable as ShadedTriangle;
          drawShadedTriangle(st);
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

  Offset makeOffset(Size size, double x, double y) {
    return size.center(Offset(x, -y));
  }

  /// draw one pixel
  void putPixel(Pixel pixel) {
    final p = Paint()
      ..color = pixel.color
      ..strokeWidth = 1;

    canvas.drawRect(makeOffset(size, pixel.x, pixel.y) & const Size(1, 1), p);
  }

  void drawLine(Line line) {
    final p = Paint()
      ..color = line.color
      ..strokeWidth = line.thickness;

    canvas.drawLine(
        size.center(line.a.toOffset()), size.center(line.b.toOffset()), p);
  }

  void drawWireframeTriangle(WireFrameTriangle wt) {
    final p = Paint()
      ..color = wt.color
      ..strokeWidth = wt.thickness;

    canvas.drawLine(
        size.center(wt.a.toOffset()), size.center(wt.b.toOffset()), p);
    canvas.drawLine(
        size.center(wt.b.toOffset()), size.center(wt.c.toOffset()), p);
    canvas.drawLine(
        size.center(wt.c.toOffset()), size.center(wt.a.toOffset()), p);
  }

  void drawFilledTriangle(FilledTriangle ft) {
    final p = Paint()
      ..color = ft.color
      ..style = PaintingStyle.fill;

    final a = ft.a.toCenteredOffset(size);
    final b = ft.b.toCenteredOffset(size);
    final c = ft.c.toCenteredOffset(size);
    final path = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..lineTo(a.dx, a.dy);
    // final path = Path()
    //   ..moveTo(ft.a.x, ft.a.y)
    //   ..lineTo(ft.b.x, ft.b.y)
    //   ..lineTo(ft.c.x, ft.c.y)
    //   ..lineTo(ft.a.x, ft.a.y);
    canvas.drawPath(path, p);

    // canvas.drawLine(
    //     size.center(ft.a.toOffset()), size.center(ft.b.toOffset()), p);
    // canvas.drawLine(
    //     size.center(ft.b.toOffset()), size.center(ft.c.toOffset()), p);
    // canvas.drawLine(
    //     size.center(ft.c.toOffset()), size.center(ft.a.toOffset()), p);
  }

  void drawShadedTriangle(ShadedTriangle st) {
    final p = Paint()
      ..color = st.color
      ..style = PaintingStyle.fill;

    final a = st.a.toCenteredOffset(size);
    final b = st.b.toCenteredOffset(size);
    final c = st.c.toCenteredOffset(size);
    final path = Path()
      ..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..lineTo(a.dx, a.dy);
    canvas.drawShadow(path, st.color, 5, true);
  }
}
