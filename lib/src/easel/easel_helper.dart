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
    double a = ((d1 - d0) / gap) / precision;

    for (int i = 0; i <= gap; i++) {
      values.add(d);
      d = d + a;
    }

    return values;
  }
}
