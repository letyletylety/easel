import 'package:flutter/material.dart';

class ArtworkExplain extends StatelessWidget {
  const ArtworkExplain({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: child,
    );
  }
}
