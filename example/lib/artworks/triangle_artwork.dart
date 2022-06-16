import 'package:easel_example/artworks/util/util.dart';
import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawables/drawables.dart';
import 'package:easel_example/src/widget/artwork.dart';
import 'package:flutter/material.dart';

class TrianglePage extends StatelessWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(
      title: 'triangle',
      children: [
        ArtworkColumn(
          left: CuratorMessage(strings: []),
          right: CodeText("""
"""),
        ),
        ArtworkColumn(
          left: CuratorMessage(strings: []),
          right: Artwork(
            components: [
              WireFrameTriangle(
                  Point(-200, -250), Point(200, 50), Point(20, 250)),
            ],
            height: 500,
            width: 500,
          ),
        )
      ],
    );
  }
}
