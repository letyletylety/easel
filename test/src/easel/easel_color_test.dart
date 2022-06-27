import 'package:easel/src/easel/easel_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('easel color ...', (tester) async {});

  test('easel color mix', () {
    Color red = const Color(0xFFFF0000);
    Color green = const Color(0xFF00FF00);

    Color newColor = (red.mix(green));

    expect(newColor, const Color(0xFF7f7f00));
  });

  group('color mix test', () {
    late Color red;
    late Color black;

    setUp(() {
      red = const Color(0xFFFF0000);
      black = const Color(0x00000000);
    });

    test('100', () {
      final stillred = red.mix(black, 0);
      expect(stillred, red);
    });

    test('0', () {
      final wholeblack = red.mix(black, 1);
      expect(wholeblack, black);
    });
  });
}
