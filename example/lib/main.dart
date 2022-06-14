import 'package:easel_example/src/easel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main(List<String> args) {
  runApp(const TestApp());
}

final gorouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (ctx, st) => const MainPage()),
]);

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: gorouter.routeInformationParser,
      routerDelegate: gorouter.routerDelegate,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TheCanvas(),
      ),
    );
  }
}

class TheCanvas extends StatelessWidget {
  const TheCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: CustomPaint(
        painter: CanvasPainter(),
      ),
    );
  }
}

class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final easel = Easel(canvas, size);

    easel.putPixel(0, 0, Colors.red);
    easel.putPixel(1, 0, Colors.red);
    easel.putPixel(2, 0, Colors.red);
    easel.putPixel(3, 0, Colors.red);
    easel.putPixel(4, 0, Colors.red);
    // p.putPixel(100, 100, Colors.red);
    // p.putPixel(100, 101, Colors.red);
    // p.putPixel(100, 102, Colors.red);
    // p.putPixel(100, 103, Colors.red);
    // p.putPixel(101, 103, Colors.red);
    // p.putPixel(102, 103, Colors.red);
    // p.putPixel(103, 103, Colors.red);
    // p.putPixel(101, 101, Colors.red);
    // p.putPixel(102, 102, Colors.red);
    // p.putPixel(103, 103, Colors.red);
    // p.putPixel(104, 104, Colors.red);
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CanvasPainter oldDelegate) => false;
}
