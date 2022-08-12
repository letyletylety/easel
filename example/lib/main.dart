import 'package:easel/easel.dart';
import 'package:easel_example/artworks/artworks.dart';
import 'package:easel_example/artworks/routes.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: gorouter.routeInformationParser,
      routerDelegate: gorouter.routerDelegate,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easel by Example'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 200,
                child: Image.asset(
                  'assets/easel.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const Text('Easel Examples'),
            Expanded(child: ListView(children: const [])),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: 400,
            child: ListView(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Easel(
                      height: 400,
                      width: 400,
                      components: [
                        Line.xyxy(-100, -100, 100, 100,
                            color: Colors.yellow, thickness: 5),
                        Pixel(-1, 1, Colors.red),
                        Pixel(-1, -1, Colors.red),
                        Pixel(1, 1, Colors.red),
                        Pixel(1, -1, Colors.red),
                        // The order of component = The order of drawing
                        // Line.xyxy(-100, -100, 100, 100, Colors.yellow),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("""
                        components: [
                          Line.xyxy(-100, -100, 100, 100,
                              color: Colors.yellow, thickness: 5),
                          Pixel(-1, 1, Colors.red),
                          Pixel(-1, -1, Colors.red),
                          Pixel(1, 1, Colors.red),
                          Pixel(1, -1, Colors.red),
                        ],
                  """
                      .trim()),
                ),
                const LineArtwork(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class TheCanvas extends StatelessWidget {
//   const TheCanvas({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 300,
//       decoration: BoxDecoration(
//         border: Border.all(),
//       ),
//       child: CustomPaint(
//         painter: CanvasPainter(),
//       ),
//     );
//   }
// }

// class CanvasPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final easel = Easel(canvas, size);
//   }

//   @override
//   bool shouldRepaint(CanvasPainter oldDelegate) => false;

//   @override
//   bool shouldRebuildSemantics(CanvasPainter oldDelegate) => false;
// }
