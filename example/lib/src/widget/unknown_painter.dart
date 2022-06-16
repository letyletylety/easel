import 'package:easel_example/src/drawable/drawable.dart';
import 'package:easel_example/src/easel/easel.dart';
import 'package:flutter/material.dart';

/// Easel 에 Artwork를 그릴 무명 화가
/// 무명 화가
class UnknownPainter extends CustomPainter {
  UnknownPainter(this.order, [this.deepDiff = false]);

  final List<Drawable> order;
  final bool deepDiff;

  @override
  void paint(Canvas canvas, Size size) {
    final Easel e = Easel(canvas, size);

    e.drawAll(order);
  }

  @override
  bool shouldRepaint(covariant UnknownPainter oldDelegate) {
    if (deepDiff) {
      return oldDelegate.order.length != order.length;
    } else {
      return false;
    }
  }

  @override
  bool shouldRebuildSemantics(UnknownPainter oldDelegate) => false;
}
