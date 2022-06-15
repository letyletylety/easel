import 'dart:ui';

import 'package:flutter/material.dart';

import 'drawables/drawables.dart';

// 그릴 수 있는 것
abstract class Drawable {}

// 색깔이 있는 그릴 수 있는 것
class ColoredDrawable extends Drawable {
  Color color = const Color(0xFF000000);

  ColoredDrawable(this.color);
}

mixin HasThickness on Drawable {
  double thickness = 1.0;

  changeThickness(double d) {
    thickness = d;
  }
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
