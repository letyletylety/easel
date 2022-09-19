import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';

class TrigonPage extends StatelessWidget {
  const TrigonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArtworkScaffoldSingleColumn(
      title: 'Trigon',
      children: [
        ArtworkColumn(
          left: const CodeText("""
Easel(
  width: 400,
  height: 400,
  components: [
    Trigon(
      Pixel(-200, -200, Colors.red),
      Pixel(200, -200, Colors.green),
      Pixel(200, 200, Colors.blue),
    ),
    Trigon(
      Pixel(-100, -100, Colors.black),
      Pixel(100, -100, Colors.white),
      Pixel(100, 100, Colors.transparent),
    ),
  ],
),
"""),
          right: Easel(
            width: 400,
            height: 400,
            components: [
              Trigon(
                Pixel(-200, -200, Colors.red),
                Pixel(200, -200, Colors.green),
                Pixel(200, 200, Colors.blue),
              ),
              Trigon(
                Pixel(-100, -100, Colors.black),
                Pixel(100, -100, Colors.white),
                Pixel(100, 100, Colors.transparent),
              ),
            ],
          ),
        ),
        CuratorMessage(
          strings: [
            buildBoldWord('Trigon'),
            buildTextSpanln(' is the triangle version of the segment.', 2),
            buildTextSpanln(
                'Trigon needs only three pixels to represent itself. If there are pixels that have a different color from the others, Trigon calculates to color between the two colors.'),
            buildTextSpanln(
                'Trigon is beautiful, It should be avoided as much as possible because it needs to perform a very expensive operation like a Shader.'),
          ],
        )
      ],
    );
  }
}
