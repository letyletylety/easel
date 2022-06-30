import 'package:easel/easel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('interpolate test', () {
    test('test0', () {
      final result = EaselHelper.interpolate(0, 100, 0, 200);

      print(result);
    });

    test('test1', () {
      final result = EaselHelper.interpolate(0, 100, 100, 100);

      print(result);
    });
    test('test2', () {
      final result = EaselHelper.interpolate(100, 0, 100, 100);

      print(result);
    });
    test('test3', () {
      final result = EaselHelper.interpolate(0, 0, 10, 10, 10);

      print(result);
    });

    group('divide segment test', () {
      test('1', () {
        final result = EaselHelper.divideSegment(
            Segment(Pixel(-100, 100), Pixel(100, 50)));
        for (var element in result) {
          expect(element.color, ColoredDrawable.black);
        }
      });
      test('2', () {
        final result = EaselHelper.divideSegment(
            Segment(Pixel(-170, 100), Pixel(100, 50)));
        for (var element in result) {
          expect(element.color, ColoredDrawable.black);
        }
      });
    });
  });
}
