import 'package:easel/easel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('color mix', () {
    Color red = const Color.fromRGBO(244, 67, 54, 1);
    Color green = const Color.fromRGBO(76, 175, 80, 1);

    Color newColor = red + green;
    debugPrint(newColor.show());

    expect(newColor, const Color.fromRGBO(255, 242, 134, 1));
  });

  test('color mix over', () {
    Color c_200_0_200 = const Color.fromRGBO(200, 0, 200, 1);
    Color c_200_100_200 = const Color.fromRGBO(200, 100, 200, 1);

    Color newColor = c_200_0_200 + c_200_100_200;
    debugPrint(newColor.show());

    expect(newColor, const Color.fromRGBO(255, 100, 255, 1));
  });

  test('color multi', () {
    Color red = const Color.fromRGBO(244, 67, 54, 1);

    Color newColor = red * 2;

    debugPrint(newColor.show());
    expect(newColor, const Color.fromRGBO(255, 134, 108, 1));
  });
}
