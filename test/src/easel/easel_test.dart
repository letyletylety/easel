import 'package:easel/easel.dart';
import 'package:easel/src/drawable/drawables/segment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('easel ...', (tester) async {
    await tester.pumpWidget(Artwork(width: 200, height: 200, components: [
      Segment(Pixel(-100, 0), Pixel(100, 0), 10),
    ]));
  });

  // benchmarkWidgets((tester) async {
  //   await tester.pumpWidget(Artwork(width: 200, height: 200, components: [
  //     Segment(Pixel(-100, 0), Pixel(100, 0)),
  //   ]));
  // });
}
