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
          left: CuratorMessage(strings: []),
          right: Artwork(
            width: 400,
            height: 400,
            components: [
              Trigon(Pixel(-100, 100), Pixel(200, 100), Pixel(50, -200)),
            ],
          ),
        )
      ],
    );
  }
}
