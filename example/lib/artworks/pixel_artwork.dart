import 'dart:async';
import 'dart:math';

import 'package:easel_example/artworks/artworks.dart';
import 'package:easel_example/src/drawable/drawable.dart';
import 'package:easel_example/src/drawable/drawables/drawables.dart';
import 'package:easel_example/src/widget/artwork.dart';
import 'package:flutter/material.dart';

class PixelPage extends StatelessWidget {
  const PixelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String code = """
Artwork(
  components: [
    Pixel(0, 0, Colors.red),
  ], 
  width: 50, 
  height: 50,
),
""";

    return ArtworkScaffoldSingleColumn(
      title: 'Pixel',
      children: [
        ArtworkColumn(
          left: RichText(
            text: TextSpan(
              children: [
                buildBoldWord('Artwork'),
                buildTextSpan('는 기존의 CustomPaint 를 대체하는 클래스 입니다.'),
                buildLineBreak(2),
                buildTextSpan('component 속성에 어떤 것을 그릴 것인지를 지정합니다.'),
                buildLineBreak(2),
                buildTextSpan('width, height 로 위젯의 크기를 지정합니다.'),
                buildLineBreak(4),
                buildBoldWord('Pixel'),
                buildTextSpan(' 클래스는 화면에 그릴 수 있는 가장 작은 Drawable 입니다.'),
                buildLineBreak(2),
                buildTextSpan('Pixel 은 x와 y 좌표, 그리고 색깔을 속성으로 가질 수 있습니다.'),
              ],
            ),
          ),
          right: const CodeText(code),
        ),
        ArtworkColumn(
          left: RichText(
            text: TextSpan(children: [
              buildTextSpan('Artwork 가운데에 빨간 픽셀을 하나 그렸습니다.'),
            ]),
          ),
          right: Artwork(
            components: [
              Pixel(0, 0, Colors.red),
            ],
            width: 50,
            height: 50,
          ),
        ),
        const PixelArtColumn(),
      ],
    );
  }
}

class PixelArtColumn extends StatefulWidget {
  const PixelArtColumn({Key? key}) : super(key: key);

  @override
  State<PixelArtColumn> createState() => _PixelArtColumnState();
}

class _PixelArtColumnState extends State<PixelArtColumn> {
  late final StreamController<List<Drawable>> _colorStreamController;
  late final Timer _timer;

  List<Drawable> a = [
    // Pixel(0, 0, Colors.red),
  ];

  @override
  void initState() {
    super.initState();

    _colorStreamController = StreamController();

    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      final x = Random().nextDouble() * 400 - 200;
      final y = Random().nextDouble() * 50 - 25;
      final color = Random().nextInt(0x1000000) + 0xFF000000;
      final p = Pixel(x, y, Color(color));

      setState(() {
        a = [...a, p];
      });

      if (a.length >= 100000) {
        timer.cancel();
      }

      _colorStreamController.add(a);
    });
  }

  @override
  void dispose() {
    _colorStreamController.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArtworkColumn(
      left: RichText(
        text: TextSpan(children: [
          buildTextSpan('잘 안보이시나요? 10만개는 어때요?'),
        ]),
      ),
      right: StreamBuilder<List<Drawable>>(
        stream: _colorStreamController.stream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Drawable>> snapshot) {
          return Artwork(
            components: snapshot.data ?? [],
            width: 50,
            height: 50,
            redraw: true,
          );
        },
      ),
    );
  }
}
