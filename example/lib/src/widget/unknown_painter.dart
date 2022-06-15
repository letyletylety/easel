import 'package:easel_example/src/drawable/drawable.dart';
import 'package:easel_example/src/easel/easel.dart';
import 'package:flutter/material.dart';

/// 무명 화가
class UnknownPainter extends CustomPainter {
  UnknownPainter(this.order);

  final List<Drawable> order;

  @override
  void paint(Canvas canvas, Size size) {
    final Easel e = Easel(canvas, size);

    e.drawAll(order);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(UnknownPainter oldDelegate) => false;
}
