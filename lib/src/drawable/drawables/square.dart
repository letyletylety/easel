import 'dart:ui';

import 'package:easel/easel.dart';

class Square extends ColoredDrawable {
  /// 사각형
  final Rect rect;

  Square(this.rect, {Color color = ColoredDrawable.black}) : super(color);

  @override
  void draw(Artwork artwork) {
    // final rect = rect;
    final p = Paint()..color = color;

    artwork.canvas.drawRect(rect, p);
  }
}
