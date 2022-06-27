import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';

// class SegmentPage extends StatelessWidget {
//   const SegmentPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ArtworkScaffoldSingleColumn(title: RouteNames.segment, children: [
//       ArtworkColumn(left: CuratorMessage(strings: []), right: Artwork(components: components));
//     ]);
//   }
// }

class SegmentPage extends StatelessWidget {
  const SegmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(title: RouteNames.segment, children: [
      ArtworkColumn(
        left: CuratorMessage(strings: [
          buildBoldWord('Segment'),
          buildTextSpanln(' 는 두 픽셀을 이어주는 선분입니다.', 2),
          buildTextSpanln('이게 왜 필요할까요?', 2),
          buildTextSpan('하나의 색으로만 이루어진 선이라면 '),
          buildBoldWord('Line'),
          buildTextSpanln(' 을 쓰는게 더 낫습니다.'),
          buildTextSpan('하지만 '),
          buildBoldWord('선을 그리는 도중 색이 변해야 하는 경우'),
          buildTextSpanln('에는 Segment 를 사용하세요.', 2),
          buildTextSpanln('Line과 달리 Segment 에는 thickness가 없습니다.'),
        ]),
        right: Artwork(width: 400, height: 400, components: [
          Segment(Pixel(-100, 150), Pixel(100, 150)),
          Segment(Pixel(-100, 100, const Color(0xFFFF0000)), Pixel(100, 100)),
          Segment(Pixel(-100, 50, const Color(0xFFFF0000)), Pixel(100, 100)),
          Segment(Pixel(-100, 0, const Color(0xFFFF0000)),
              Pixel(100, 50, const Color(0xFF0000FF)), 10),
        ]),
      ),
    ]);
  }
}
