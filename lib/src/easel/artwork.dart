import 'package:easel/src/2d/area_object.dart';
import 'package:easel/src/drawable/drawables.dart';
import 'package:easel/src/easel/easel_color.dart';
import 'package:easel/src/easel/easel_helper.dart';
import 'package:flutter/material.dart';

/// the 2D canvas
/// canvas helper
class Artwork {
  final Canvas canvas;
  final Size size;

  final double pixelPrecision;

  const Artwork(this.canvas, this.size, {this.pixelPrecision = 1});

  void drawAll(List<Drawable> component) {
    for (var element in component) {
      element.draw(this);
    }

    // for (Drawable drawable in component) {
    //   switch (drawable.runtimeType) {
    //     case Pixel:
    //       Pixel p = drawable as Pixel;
    //       putPixel(p);
    //       break;
    //     case Line:
    //       Line l = drawable as Line;
    //       drawLine(l);
    //       break;
    //     case WireFrameTriangle:
    //       WireFrameTriangle wt = drawable as WireFrameTriangle;
    //       drawWireframeTriangle(wt);
    //       break;

    //     case FilledTriangle:
    //       FilledTriangle ft = drawable as FilledTriangle;
    //       drawFilledTriangle(ft);
    //       break;
    //     case ShadedTriangle:
    //       ShadedTriangle st = drawable as ShadedTriangle;
    //       drawShadedTriangle(st);
    //       break;
    //     case Circle:
    //       Circle c = drawable as Circle;
    //       drawCircle(c);
    //       break;
    //     case Segment:
    //       Segment seg = drawable as Segment;
    //       drawSegment(seg);
    //       break;
    //     case Trigon:
    //       Trigon tri = drawable as Trigon;
    //       drawTrigon(tri);
    //       break;
    //     case Square:
    //       Square square = drawable as Square;
    //       drawSquare(square);
    //       break;
    //     default:
    //       debugPrint('can\'t draw : unknown type: ?');
    //   }
    //   // if(drawable is Pixel){
    //   //   putPixel(pixel);
    //   // }else {

    //   // }
    // }
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

  void drawTrigon(Trigon tri) {
    final sorted = tri.sort();
    final a = sorted.a;
    final b = sorted.b;
    final c = sorted.c;

    debugPrint("$a, $b, $c");

    // |AB|
    final abPixels = EaselHelper.divideSegment(Segment(a, b));

    // |AC|
    final acPixels = EaselHelper.divideSegment(Segment(a, c));

    debugPrint(abPixels.length.toString());
    debugPrint(acPixels.length.toString());

    if (abPixels.length < acPixels.length) {
      final ratio = acPixels.length / abPixels.length;
      for (int i = 0; i < abPixels.length; i++) {
        drawSegment(
          Segment(abPixels[i], acPixels[(ratio * i).floor()], precision: 1),
        );
      }
    } else {
      final ratio = abPixels.length / acPixels.length;
      debugPrint(ratio.toString());
      for (int i = 0; i < acPixels.length; i++) {
        final seg =
            Segment(acPixels[i], abPixels[(ratio * i).floor()], precision: 1);
        // debugPrint(seg.toString());
        drawSegment(seg);
      }
    }
  }

  void drawSquare(Square s) {
    final rect = s.rect;
    final p = Paint()..color = s.color;

    canvas.drawRect(rect, p);
  }
}
