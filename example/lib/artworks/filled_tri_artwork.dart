import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';

class FilledTriPage extends StatelessWidget {
  const FilledTriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(title: 'FilledTriangle', children: [
      ArtworkColumn(
          left: CuratorMessage(
            strings: [
              buildBoldWord('FilledTriangle'),
              buildTextSpan('는 '),
              buildBoldWord('WireFrameTriangle'),
              buildTextSpanln(' 에서 내부를 칠하지 않은 것입니다.', 2),
            ],
          ),
          right: const CodeText("""
Artwork(
  components: [
    FilledTriangle(Point(-200, -250), Point(200, 50), Point(20, 250)),
    FilledTriangle.xyxyxy(-200, -50, 200, 250, 20, -70,
        color: Colors.green),
  ],
  width: 500,
  height: 500,
),
""")),
      ArtworkColumn(
        left: CuratorMessage(strings: [
          buildTextSpanln(''),
        ]),
        right: Easel(
          components: [
            FilledTriangle(Point(-200, -250), Point(200, 50), Point(20, 250)),
            FilledTriangle.xyxyxy(-200, -50, 200, 250, 20, -70,
                color: Colors.green),
          ],
          width: 500,
          height: 500,
        ),
      ),
    ]);
  }
}
