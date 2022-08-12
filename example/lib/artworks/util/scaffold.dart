import 'package:easel_example/artworks/artworks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ExampleScaffold extends HookWidget {
  const ExampleScaffold({Key? key, required this.body, required this.title})
      : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final scon = useScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: InkWell(
                onTap: () {
                  context.go('/');
                },
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
            ),
            const Text('Easel Examples'),
            Expanded(
              child: ListView(
                controller: scon,
                children: buildMenu(context),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}

class ArtworkScaffoldSingleColumn extends StatelessWidget {
  const ArtworkScaffoldSingleColumn({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      title: title,
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: children,
      ),
    );
  }
}

class ArtworkScaffoldTwoColumn extends StatelessWidget {
  const ArtworkScaffoldTwoColumn(
      {Key? key, required this.title, required this.left, required this.right})
      : super(key: key);

  final String title;
  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: left,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: right,
            ),
          ),
        ],
      ),
      title: title,
    );
  }
}
