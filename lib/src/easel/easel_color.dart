import 'package:flutter/material.dart';

/// upgrade color
extension EaselColor on Color {
  Color clamp(int r, int g, int b) {
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);
    return Color.fromRGBO(r, g, b, opacity);
  }

  Color operator *(num k) {
    var r = red * k;
    var g = green * k;
    var b = blue * k;

    return clamp(r.toInt(), g.toInt(), b.toInt());
  }

  Color operator +(Color c) {
    var r = red + c.red;
    var g = green + c.green;
    var b = blue + c.blue;

    return clamp(r, g, b);
  }

  String show() {
    return ("red: $red, green: $green, blue: $blue, opacity: $opacity");
  }
}
