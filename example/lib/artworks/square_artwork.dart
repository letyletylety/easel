import 'package:easel/easel.dart';
import 'package:easel_example/artworks/util/util.dart';
import 'package:flutter/material.dart';

class SquareArtworkPage extends StatelessWidget {
  const SquareArtworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(title: 'Square', children: [
      ArtworkColumn(
        left: CuratorMessage(strings: [
          buildBoldWord('Square'),
          buildTextSpan(' '),
          buildTextSpanln('는 사각형을 그려준다.', 2),
          buildTextSpanln('dart:ui 의 Rect를 사용한다.', 2),
          buildTextSpanln('color 로 색상을 지정할 수 있다.'),
        ]),
        right: const CodeText('''
Easel(
  components: [
    Square(Rect.fromLTWH(100, 100, 200, 200)),
    Square(Rect.fromLTWH(10, 10, 200, 200), color: Colors.red),
  ],
  height: 400,
  width: 400,
),
        '''),
      ),
      const ArtworkColumn(
        left: CuratorMessage(strings: []),
        right: SquareArtwork(),
      )
    ]);
  }
}

class SquareArtwork extends StatelessWidget {
  const SquareArtwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 400,
        child: Easel(
          components: [
            Square(const Rect.fromLTWH(100, 100, 200, 200)),
            Square(const Rect.fromLTWH(10, 10, 200, 200), color: Colors.red),
          ],
          height: 400,
          width: 400,
        ),
      ),
    );
  }
}

// ArtworkColumn(
//   left: CuratorMessage(strings: [
//     buildBoldWord('x, y'),
//     buildTextSpanln(' 좌표계.'),
//     buildTextSpan('(0,0) 은 Artwork의 중앙을 나타냅니다.'),
//   ]),
//   right: Artwork(
//     components: [
//       Line.xyxy(-100, 0, 100, 0, thickness: 0.5),
//       Line.xyxy(0, -100, 0, 100, thickness: 0.5),
//       //
//       Pixel(50, 50, Colors.red),
//       Pixel(-50, -50, Colors.yellow),
//       Pixel(-50, 50, Colors.green),
//       Pixel(50, -50, Colors.blue),
//     ],
//     width: 200,
//     height: 200,
//   ),
// ),
