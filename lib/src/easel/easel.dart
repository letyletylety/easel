import 'package:easel/src/2d/area_object.dart';
import 'package:easel/src/drawable/drawable.dart';
import 'package:easel/src/easel/easel_color.dart';
import 'package:flutter/material.dart';

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
        case Circle:
          Circle c = drawable as Circle;
          drawCircle(c);
          break;
        case Segment:
          Segment seg = drawable as Segment;
          drawSegment(seg);
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
  void putPixel(Pixel pixel, [double precision = 1]) {
    final p = Paint()
      ..color = pixel.color
      ..strokeWidth = precision;

    final psize = Size(precision, precision);

    canvas.drawRect(makeOffset(size, pixel.x, pixel.y) & psize, p);
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
    // final p = Paint()
    //   ..color = st.color
    //   ..style = PaintingStyle.fill;

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

  void drawCircle(Circle c) {
    final p = Paint()..color = c.color;

    final co = c.center.toCenteredOffset(size);

    canvas.drawCircle(co, c.radius, p);
  }

  ///  draw [Segment]
  void drawSegment(Segment seg) {
    final a = seg.a;
    final b = seg.b;

    // // parallel to x axis
    // if (b.x - a.x == 0) {
    //   canvas.drawLine(
    //       a.toCenteredOffset(size), b.toCenteredOffset(size), paint);
    // }
    // // parallel to y axis
    // if (b.y - a.y == 0) {}

    late int unit;
    if ((b.x - a.x).abs() > (b.y - a.y).abs()) {
      // below 45
      // ▶◀
      unit = (b.x - a.x).abs().floor();
    } else {
      unit = (b.y - a.y).abs().floor();
    }

    if (unit == 0) {
      putPixel(a);
    }

    unit *= seg.precision;

    final dx = (b.x - a.x) / unit;
    final dy = (b.y - a.y) / unit;

    var point = Point(a.x, a.y);
    var nextPoint = point + Offset(dx, dy);

    for (int i = 0; i < unit; i++) {
      final mixed = a.color.mix(b.color, i / unit);
      canvas.drawLine(
        point.toCenteredOffset(size),
        nextPoint.toCenteredOffset(size),
        Paint()..color = mixed,
      );

      point = nextPoint;
      nextPoint += Offset(dx, dy);
    }
  }
  //   final unit = 1.0 / precision;
  //   // final p = Paint()..color = seg.color;

  //   if ((b.x - a.x).abs() > (b.y - a.y).abs()) {
  //     if (a.x > b.x) {
  //       drawSegment(Segment(b, a));
  //       return;
  //     }
  //     final ys = EaselHelper.interpolate(a.x, a.y, b.x, b.y, precision);

  //     var x = a.x;
  //     final len = ys.length;
  //     for (int i = 0; i < len; i++) {
  //       final mixed = a.color.mix(b.color, i / len);
  //       putPixel(
  //         Pixel(
  //           x,
  //           ys[i].toDouble(),
  //           mixed,
  //         ),
  //         // unit.toDouble(),
  //       );
  //       x += unit;
  //     }
  //   } else {
  //     if (a.y > b.y) {
  //       drawSegment(Segment(b, a));
  //       return;
  //     }

  //     final xs = EaselHelper.interpolate(a.y, a.x, b.y, b.x, precision);

  //     var y = a.y;
  //     final len = xs.length;
  //     for (int i = 0; i < len; i++) {
  //       final mixed = a.color.mix(b.color, i / len);
  //       putPixel(
  //         Pixel(
  //           xs[i].toDouble(),
  //           y,
  //           mixed,
  //         ),
  //         // unit.toDouble(),
  //       );
  //       y += unit;
  //     }
  //   }
}
