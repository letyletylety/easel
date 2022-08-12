import 'package:easel/src/drawable/drawables/drawable.dart';
import 'package:easel/src/easel/artwork.dart';
import 'package:flutter/material.dart';

/// Easel 에 Artwork를 그릴 무명 화가
/// 무명 화가
class UnknownPainter extends CustomPainter {
  UnknownPainter(this.order, [this.deepDiff = false]);

  final List<Drawable> order;
  final bool deepDiff;

  @override
  void paint(Canvas canvas, Size size) {
    final Artwork e = Artwork(canvas, size);

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
