import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// HOW TO ADD PAGE
/// / seperate pages
/// // means seperate and put divider
const _pageOrder = 'index//pixel/line/triangle';

final gorouter = GoRouter(routes: [
  GoRoute(path: '/', name: 'index', builder: (ctx, st) => const IndexPage()),
  GoRoute(
      path: '/pixel', name: 'pixel', builder: (ctx, st) => const PixelPage()),
  GoRoute(path: '/line', name: 'line', builder: (ctx, st) => const LinePage()),
  GoRoute(
      path: '/triangle',
      name: 'triangle',
      builder: (ctx, st) => const TrianglePage()),
]);

List<Widget> buildMenu(BuildContext context) {
  final orderList = _pageOrder.split('/');

  return orderList.map((e) {
    if (e.isEmpty) {
      return const Divider();
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
        child: ListView(children: buildMenu(context)),
      ),
      title: 'Easel By Example',
    );
  }
}
