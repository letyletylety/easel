import 'package:flutter/material.dart';

import '../drawable/drawables/drawable.dart';
import 'unknown_painter.dart';

/// Easel
/// CustomCanvas 를 대체하는 위젯
/// widget
class Easel extends StatelessWidget {
  const Easel({
    Key? key,
    required this.components,
    this.width = 0,
    this.height = 0,
    this.redraw = false,
  }) : super(key: key);

  final double width;
  final double height;

  final List<Drawable> components;

  final bool redraw;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        willChange: redraw,
        isComplex: redraw,
        size: Size(width, height),
        painter: UnknownPainter(
          components,
          redraw,
        ),
      ),
    );
  }
}
