import 'package:easel_example/artworks/artworks.dart';
import 'package:easel_example/src/2d/area_object.dart';
import 'package:easel_example/src/drawable/drawables/drawables.dart';
import 'package:easel_example/src/widget/artwork.dart';
import 'package:flutter/material.dart';

class CirclePage extends StatelessWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(
      title: 'Circle',
      children: [
        ArtworkColumn(
          left: CuratorMessage(
            strings: [
              buildBoldWord('Circle'),
              buildTextSpanln('은 원을 의미합니다.', 2),
              buildTextSpanln('하나의 Point와 radius 를 입력으로 받습니다.', 2),
              buildTextSpanln('xyr 생성자를 이용하면 Point를 따로 만들지 않아도 괜찮습니다.'),
            ],
          ),
          right: const CodeText("""Artwork(
  width: 400,
  height: 400,
  components: [
    ...coordLines(400, 400),
    Circle(Point(100, 100), 100),
    Circle.xyr(-100, -100, 50, color: Colors.lightBlue)
  ],
),
"""),
        ),
        ArtworkColumn(
          left: CuratorMessage(
            strings: [],
          ),
          right: Artwork(
            width: 400,
            height: 400,
            components: [
              ...coordLines(400, 400),
              Circle(Point(100, 100), 100),
              Circle.xyr(-100, -100, 50, color: Colors.lightBlue)
            ],
          ),
        )
      ],
    );
  }
}