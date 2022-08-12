import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';

class FilledTriPage extends StatelessWidget {
  const FilledTriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(title: 'FilledTriangle', children: [
      const ArtworkColumn(left: CuratorMessage(strings: []), right: CodeText("""
Easel(
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
      ArtworkColumn(
        left: CuratorMessage(strings: [
          buildTextSpanln('helo'),
        ]),
        right: Easel(
          components: [
            ShadedTriangle(Point(-200, -250), Point(200, 50), Point(20, 250)),
            ShadedTriangle.xyxyxy(-200, -50, 200, 250, 20, -70,
                color: Colors.green),
          ],
          width: 500,
          height: 500,
        ),
      )
    ]);
  }
}
