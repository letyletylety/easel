import 'package:easel/src/drawable/drawables/line.dart';
import 'package:easel/src/drawable/drawables/pixel.dart';
import 'package:easel/src/easel/artwork.dart';
import 'package:flutter/material.dart';

/// 그릴 수 있는 것
abstract class Drawable {
  /// 그리기
  void draw(Artwork artwork);
}

// 색깔이 있는 그릴 수 있는 것
abstract class ColoredDrawable extends Drawable {
  static const black = Color(0xFF000000);

  Color color = black;

  ColoredDrawable(this.color);
}

mixin HasThickness on Drawable {
  double thickness = 1.0;

  changeThickness(double d) {
    thickness = d;
  }
}

mixin HasPrecision on Drawable {
  int precision = 1;
  changePrecision(int p) {
    if (p < 1) {
      throw PrecisionError("?");
    }

    precision = p;
  }
}

mixin Stringer on Drawable {
  @override
  String toString() {
    return super.toString();
  }
}

class PrecisionError extends Error {
  PrecisionError(String s);
}

abstract class DrawableDebugger {
  static print(Drawable drawable) {
    switch (drawable.runtimeType) {
      case Pixel:
        Pixel p = drawable as Pixel;
        debugPrint('Pixel: ${p.x}, ${p.y}, ${p.color}');
        break;
      case Line:
        Line p = drawable as Line;
        debugPrint('Line: ${p.a.v}, ${p.b.v}, ${p.color}');
        break;
      default:
        debugPrint('unknown type: ?');
    }
  }
}
