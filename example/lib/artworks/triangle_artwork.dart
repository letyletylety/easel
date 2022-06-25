import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  late TapGestureRecognizer _tap1;
  late TapGestureRecognizer _tap2;

  void _handleTap1() {
    context.pushNamed(RouteNames.wireFrameTri);
  }

  void _handleTap2() {
    context.pushNamed(RouteNames.filledTri);
  }

  @override
  void initState() {
    super.initState();
    _tap1 = TapGestureRecognizer()..onTap = _handleTap1;
    _tap2 = TapGestureRecognizer()..onTap = _handleTap2;
  }

  @override
  void dispose() {
    _tap1.dispose();
    _tap2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(
      title: 'triangle',
      children: [
        ArtworkColumn(
          left: CuratorMessage(
            strings: [
              buildBoldWord(''),
              buildTextSpanln('Easel 에는 2 종류의 삼각형이 있습니다.', 2),
              buildBoldWord('WireFrameTriangle', _tap1),
              buildLineBreak(2),
              buildBoldWord('FilledTriangle', _tap2),
              buildLineBreak(2),
            ],
          ),
          right: Artwork(
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

        //       Line.xyxy(-100, 0, 100, 0, thickness: 0.5),
        //       Line.xyxy(0, -100, 0, 100, thickness: 0.5),