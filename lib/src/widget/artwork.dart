import 'package:easel/src/drawable/drawables/drawable.dart';
import 'package:easel/src/widget/widget.dart';
import 'package:flutter/material.dart';

/// widget
class Artwork extends StatelessWidget {
  const Artwork({
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
