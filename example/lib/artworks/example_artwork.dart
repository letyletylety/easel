import 'package:easel_example/main.dart';
import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawables/line.dart';
import 'package:easel_example/src/widget/artwork.dart';
import 'package:flutter/material.dart';

class LineArtwork extends StatelessWidget {
  const LineArtwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Artwork(
      components: [
        Line(Point(100, 200), Point(-100, -200), color: Colors.red),
        Line(Point(100, 100), Point(-100, -100), color: Colors.yellow),
        Line.xyxy(100, 0, -100, 0),
        Line.xyxy(-10, -10, 50, 0, color: const Color(0xFF16ff23), thickness: 5)
      ],
      height: 400,
      width: 400,
    );
  }
}
