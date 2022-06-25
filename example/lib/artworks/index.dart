import 'package:easel_example/artworks/artworks.dart';
import 'package:easel_example/artworks/filled_tri_artwork.dart';
import 'package:easel_example/artworks/wireframe_tri_artwork.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// HOW TO ADD PAGE
/// / seperate pages
/// // means seperate and put divider
abstract class RouteNames {
  static const _pageOrder =
      '$index//$pixel/$line/$triangle/>$wireFrameTri/>$filledTri/$circle//';

  static const index = 'index';
  static const pixel = 'pixel';
  static const triangle = 'triangle';
  static const wireFrameTri = 'wireFrameTri';
  static const filledTri = 'filledTri';

  static const line = 'line';

  static const circle = 'circle';
}

final gorouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.index,
      // builder: (ctx, st) => const IndexPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const IndexPage(),
      ),
    ),
    GoRoute(
      path: '/pixel',
      name: RouteNames.pixel,
      // builder: (ctx, st) => const PixelPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const PixelPage(),
      ),
    ),
    GoRoute(
      path: '/line',
      name: RouteNames.line,
      builder: (ctx, st) => const LinePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const LinePage(),
      ),
    ),
    GoRoute(
      path: '/triangle',
      name: RouteNames.triangle,
      builder: (ctx, st) => const TrianglePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const TrianglePage(),
      ),
    ),
    GoRoute(
      path: '/wireFrameTri',
      name: RouteNames.wireFrameTri,
      // builder: (ctx, st) => const WireFrameTriPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const WireFrameTriPage(),
      ),
    ),
    GoRoute(
      path: '/filledTri',
      name: RouteNames.filledTri,
      // builder: (ctx, st) => const FilledTriPage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const FilledTriPage(),
      ),
    ),
    GoRoute(
      path: '/${RouteNames.circle}',
      name: RouteNames.circle,
      // builder: (ctx, st) => const CirclePage(),
      pageBuilder: (context, st) => MaterialPage(
        key: st.pageKey,
        child: const CirclePage(),
      ),
    ),
    // GoRoute(path: ),
  ],
  urlPathStrategy: UrlPathStrategy.path,
);

List<Widget> buildMenu(BuildContext context) {
  final orderList = RouteNames._pageOrder.split('/');

  return orderList.map((e) {
    if (e.isEmpty) {
      return const Divider();
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
            'The CustomPaint in reactive way',
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
