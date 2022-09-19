import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// HOW TO ADD PAGE
/// / seperate pages
/// // means seperate and put divider
abstract class RouteNames {
  // static const _pageOrder =
  //     '/$pixel/$line/$triangle/>$wireFrameTri/>$filledTri/$circle/$square//$segment/$trigon';
  static const _pageOrder =
      '#Base Shape/$pixel/$line/$triangle/>$wireFrameTri/>$filledTri/$circle/$square//';

  static const index = 'index';
  static const pixel = 'pixel';
  static const triangle = 'triangle';
  static const wireFrameTri = 'wireFrameTri';
  static const filledTri = 'filledTri';
  static const square = 'square';

  static const line = 'line';

  static const circle = 'circle';

  static const segment = 'segment';

  static const trigon = 'trigon';
}

List<Widget> buildMenu(BuildContext context) {
  final orderList = RouteNames._pageOrder.split('/');

  return orderList.map((e) {
    if (e.isEmpty) {
      return const Divider();
    }

    if (e.startsWith('#')) {
      e = e.replaceFirst('#', '');
      return ListTile(
        leading: Text(
          e,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      );
    }

    if (e.startsWith('>')) {
      e = e.replaceFirst('>', '');
      return ListTile(
        leading: const Text('>'),
        title: Text(e),
        onTap: () {
          context.goNamed(e);
        },
      );
    }
    return ListTile(
      title: Text(e),
      onTap: () {
        context.goNamed(e);
      },
    );
  }).toList();
}

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/easel.png'),
          ),
          const Text(
            'easel',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Text(
            'The CustomPaint in a declarative way',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          ...buildMenu(context)
        ]),
      ),
      title: 'Easel By Example',
    );
  }
}
