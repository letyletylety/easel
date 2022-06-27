import 'package:easel/easel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('easel draw segment', (tester) async {
    await tester.pumpWidget(Artwork(width: 200, height: 200, components: [
      Segment(Pixel(-100, 0), Pixel(100, 0), precision: 10),
    ]));
  });

  // benchmarkWidgets((tester) async {
  //   await tester.pumpWidget(Artwork(width: 200, height: 200, components: [
  //     Segment(Pixel(-100, 0), Pixel(100, 0)),
  //   ]));
  // });
}
