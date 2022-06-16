import 'package:easel_example/artworks/util/util.dart';
import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawables/line.dart';
import 'package:easel_example/src/widget/artwork.dart';
import 'package:flutter/material.dart';

class LinePage extends StatelessWidget {
  const LinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(title: 'line', children: [
      ArtworkColumn(
        left: CuratorMessage(strings: [
          buildBoldWord('Line'),
          buildTextSpanln('은 두 점을 잇는 선 입니다.'),
          buildLineBreak(1),
          buildTextSpanln('Point 2개로 선언하거나, xyxy 생성자를 이용해서 선언할 수 있습니다.'),
          buildLineBreak(1),
          buildTextSpanln('color와 thickness 등을 이용할 수 있습니다.'),
        ]),
        right: const CodeText('''
Artwork(
  components: [
    Line(Point(100, 200), Point(-100, -200), color: Colors.red),
    Line(Point(100, 100), Point(-100, -100), color: Colors.yellow),
    Line.xyxy(100, 0, -100, 0),
    Line.xyxy(-10, -10, 50, 0, color: const Color(0xFF16ff23), thickness: 5)
  ],
  height: 400,
  width: 400,
);
'''),
      ),
      const ArtworkColumn(
        left: CuratorMessage(strings: []),
        right: LineArtwork(),
      )
    ]);
  }
}

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
