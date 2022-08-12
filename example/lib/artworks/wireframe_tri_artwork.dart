import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';

class WireFrameTriPage extends StatelessWidget {
  const WireFrameTriPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(
      title: 'WireFrameTriangle',
      children: [
        ArtworkColumn(
          left: CuratorMessage(strings: [
            buildBoldWord('WireFrameTriangle'),
            buildTextSpanln('은 3개의 선으로 이루어진 삼각형입니다.', 2),
            buildTextSpanln(
                '(엄밀하게는 삼각형보다는 그냥 3개의 점을 3개의 선으로 잇는 것이라고 생각하는게 좋습니다.', 1),
            buildTextSpanln('기하학적으로 삼각형이 될 수 없는 점 3개가 들어와도 선을 3개 긋습니다.)', 2),
            buildTextSpanln(
                'WireFrameTriangle 에는 color와 thickness를 지정할 수 있습니다.', 2),
            buildTextSpanln('xyxyxy 생성자를 이용해서 Point 없이 생성할 수도 있습니다.', 2),
          ]),
          right: const CodeText("""Easel(
  components: [
    // this is helper method
    ...coordLines(500, 500),
    WireFrameTriangle(
        Point(-200, -250), Point(200, 50), Point(20, 250)),
    WireFrameTriangle(Point(-100, -10), Point(200, 50), Point(0, 250),
        color: Colors.blue),
    WireFrameTriangle.xyxyxy(0, 20, 30, 60, 10, 70,
        color: Colors.red, thickness: 2.0),
  ],
  height: 500,
  width: 500,
),
"""),
        ),
        ArtworkColumn(
          left: const CuratorMessage(strings: []),
          right: Easel(
            components: [
              // this is helper method
              ...coordLines(500, 500),
              WireFrameTriangle(
                  Point(-200, -250), Point(200, 50), Point(20, 250)),
              WireFrameTriangle(Point(-100, -10), Point(200, 50), Point(0, 250),
                  color: Colors.blue),
              WireFrameTriangle.xyxyxy(0, 20, 30, 60, 10, 70,
                  color: Colors.red, thickness: 2.0),
            ],
            height: 500,
            width: 500,
          ),
        )
      ],
    );
  }
}
