import 'package:easel/easel.dart';

/// x-y coordinate Line
List<Line> coordLines(int width, int height) => [
      Line.xyxy(-width / 2, 0, width / 2, 0, thickness: 0.5),
      Line.xyxy(0, -height / 2, 0, height / 2, thickness: 0.5),
    ];
