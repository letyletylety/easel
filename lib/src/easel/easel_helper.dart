import 'package:easel/easel.dart';

/// helper class
abstract class EaselHelper {
  static List<num> interpolate(num i0, num d0, num i1, num d1,
      [int precision = 1]) {
    if (i0 == i1) {
      return [d0];
    }

    var values = <num>[];

    final if0 = i0.floor();
    final if1 = i1.floor();
    final gap = (if1 - if0) * precision;

    num d = d0;
    double a = ((d1 - d0) / gap);

    for (int i = 0; i <= gap; i++) {
      values.add(d);
      d = d + a;
    }

    return values;
  }

  /// divide segment into the list of pixels
  static List<Pixel> divideSegment(Segment seg) {
    final a = seg.a;
    final b = seg.b;

    final dx = (a.x - b.x).abs();
    final dy = (a.y - b.y).abs();

    late final double unit;
    if (dx < dy) {
      unit = dy;
    } else {
      unit = dx;
    }

    // a == b
    if (unit == 0) {
      return [a];
    }

    final result = <Pixel>[a];

    for (int i = 1; i <= unit; i++) {
      result.add(Pixel(
        a.x + i * (b.x - a.x) / unit,
        a.y + i * (b.y - a.y) / unit,
        a.color.mix(b.color, i / unit),
      ));
    }

    return result;
  }
}
