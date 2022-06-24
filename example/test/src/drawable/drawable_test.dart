import 'package:easel_example/src/drawable/drawable.dart';
import 'package:easel_example/src/drawable/drawables/drawables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('drawalbe test', () {
    test('pixel test', () {
      Pixel a = Pixel(100, 200, Colors.red);

      DrawableDebugger.print(a);
    });

    test('line test', () {
      Line a = Line.xyxy(100.0, 200.0, 200.0, 300.0, color: Colors.red);

      DrawableDebugger.print(a);
    });
  });
}
