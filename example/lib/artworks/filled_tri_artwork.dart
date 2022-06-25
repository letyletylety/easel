import 'package:easel_example/artworks/artworks.dart';
import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawables/drawables.dart';
import 'package:easel_example/src/widget/artwork.dart';
import 'package:flutter/material.dart';

class FilledTriPage extends StatelessWidget {
  const FilledTriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(title: 'FilledTriangle', children: [
      ArtworkColumn(left: CuratorMessage(strings: []), right: CodeText("""
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
        right: Artwork(
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
        right: Artwork(
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
