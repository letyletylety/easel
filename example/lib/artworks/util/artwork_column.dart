import 'package:easel_example/artworks/util/util.dart';
import 'package:flutter/material.dart';

class ArtworkColumn extends StatelessWidget {
  final Widget left;

  final Widget right;

  const ArtworkColumn({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: left,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ArtworkExplain(child: right),
              ),
            ),
          ],
        ),
      );
}
