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
          buildTextSpanln(' 을 쓰는게 성능면에서 훨씬 더 낫습니다.'),
          buildTextSpan('하지만 '),
          buildBoldWord('선을 그리는 도중 색이 변해야 하는 경우'),
          buildTextSpanln('에는 Segment 를 사용하세요.', 2),
          buildTextSpanln('Line과 달리 Segment 에는 thickness가 없습니다.', 4),
          buildTextSpanln(
            'precision 값은 얼마나 정밀하게 선을 표현하는 지를 의미하고, 보통 계단 현상을 줄이기 위해서 사용합니다.',
          ),
          buildTextSpanln(
              '이 값이 커진다고 해서 무조건 이 현상이 줄어드는 것은 아니므로 최대한 이 값을 작게 유지하세요'),
          buildTextSpanln('기본값은 10으로 설정되어 있습니다.', 2),
        ]),
        right: const CodeText("""
Artwork(width: 400, height: 400, components: [
  // Line(Point(-100, 150), Point(100, 150)),
  Segment(Pixel(-100, 150), Pixel(100, 150)),
  Segment(Pixel(-100, 100, const Color(0xFFFF0000)), Pixel(100, 100)),
  Segment(Pixel(-100, 50, const Color(0xFFFF0000)), Pixel(100, 100)),
  Segment(Pixel(-100, 0, const Color(0xFFFF0000)),
      Pixel(100, 50, const Color(0xFF0000FF)),
      precision: 10),
  Segment(Pixel(-100, -50, const Color(0xFFFF0000)),
      Pixel(100, 0, const Color(0xFF0000FF)),
      precision: 20),
  // 오히려 계단 현상이 심해짐
  Segment(Pixel(-100, -100, const Color(0xFFFF0000)),
      Pixel(100, -50, const Color(0xFF0000FF)),
      precision: 100),
  // black and white lines
  Segment(
    Pixel(-150, -100, const Color(0xFF000000)),
    Pixel(-100, -50, const Color(0xFFFFFFFF)),
  ),
  Segment(
    Pixel(-150, 200, const Color(0xFF000000)),
    Pixel(-100, 50, const Color(0xFFFFFFFF)),
  ),
  Segment(
    Pixel(-150, 200, const Color(0xFF000000)),
    Pixel(-100, 50, const Color(0xFFFFFFFF)),
  ),
]),

"""),
      ),
      ArtworkColumn(
        left: const CuratorMessage(strings: []),
        right: Artwork(width: 400, height: 400, components: [
          // same as Line(Point(-100, 150), Point(100, 150)),
          Segment(Pixel(-100, 150), Pixel(100, 150)),
          Segment(Pixel(-100, 100, const Color(0xFFFF0000)), Pixel(100, 100)),
          Segment(Pixel(-100, 50, const Color(0xFFFF0000)), Pixel(100, 100)),
          Segment(Pixel(-100, 0, const Color(0xFFFF0000)),
              Pixel(100, 50, const Color(0xFF0000FF)),
              precision: 10),
          Segment(Pixel(-100, -50, const Color(0xFFFF0000)),
              Pixel(100, 0, const Color(0xFF0000FF)),
              precision: 20),
          Segment(Pixel(-100, -100, const Color(0xFFFF0000)),
              Pixel(100, -50, const Color(0xFF0000FF)),
              precision: 100),
          // black and white lines
          Segment(
            Pixel(-200, -100, const Color(0xFF000000)),
            Pixel(-150, -50, const Color(0xFFFFFFFF)),
          ),
          Segment(
            Pixel(-150, -100, const Color(0xFF000000)),
            Pixel(-100, -50, const Color(0xFFFFFFFF)),
          ),
          Segment(
            Pixel(-150, 200, const Color(0xFF000000)),
            Pixel(-100, 50, const Color(0xFFFFFFFF)),
          ),
          Segment(
            Pixel(-150, 200, const Color(0xFF000000)),
            Pixel(-100, 50, const Color(0xFFFFFFFF)),
          ),
        ]),
      ),
    ]);
  }
}
