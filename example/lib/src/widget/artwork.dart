import 'package:easel_example/src/drawable/drawable.dart';
import 'package:easel_example/src/widget/unknown_painter.dart';
import 'package:flutter/material.dart';

/// widget
class Artwork extends StatelessWidget {
  const Artwork(
      {Key? key,
      required this.components,
      required this.width,
      required this.height})
      : super(key: key);

  final double width;
  final double height;

  final List<Drawable> components;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: UnknownPainter(
          components,
        ),
      ),
    );
  }
}
