import 'package:flutter/material.dart';

/// upgrade color
extension EaselColor on Color {
  Color clamp(int a, int r, int g, int b) {
    a = a.clamp(0, 255);
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);
    return Color.fromARGB(a, r, g, b);
  }

  Color operator *(num k) {
    var a = alpha * k;
    var r = red * k;
    var g = green * k;
    var b = blue * k;

    return clamp(a.toInt(), r.toInt(), g.toInt(), b.toInt());
  }

  Color operator +(Color c) {
    var a = alpha + c.alpha;
    var r = red + c.red;
    var g = green + c.green;
    var b = blue + c.blue;

    return clamp(a, r, g, b);
  }

  /// color mix
  /// mix ([otherratio] * 100 ) % of [other] color and (1- [otherratio])* 100 % of [this] color
  /// [otherRatio] should be in [0, 1], otherwise it will be clamped.
  Color mix(Color other, [otherRatio = 0.5]) {
    otherRatio = otherRatio.clamp(0, 1);
    return (this * (1 - otherRatio)) + (other * otherRatio);
  }

  String show() {
    return ("red: $red, green: $green, blue: $blue, opacity: $opacity");
  }
}
