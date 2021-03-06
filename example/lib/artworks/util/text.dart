import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan buildBoldWord(String text, [GestureRecognizer? recognizer]) =>
    TextSpan(
      recognizer: recognizer,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      text: text,
    );

TextSpan buildTextSpan(String text, [GestureRecognizer? recognizer]) =>
    TextSpan(
      recognizer: recognizer,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      text: text,
    );

TextSpan buildTextSpanln(String text, [int line = 1]) {
  String blanks = "";
  for (int i = 0; i < line; i++) {
    blanks += '\n';
  }
  return TextSpan(
    style: const TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
    text: '$text$blanks',
  );
}

TextSpan buildLineBreak(int line) {
  String text = "";
  for (int i = 0; i < line; i++) {
    text += '\n';
  }

  return TextSpan(
    text: text,
  );
}

class CuratorMessage extends StatelessWidget {
  const CuratorMessage({Key? key, required this.strings}) : super(key: key);

  final List<InlineSpan> strings;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: strings,
      ),
    );
  }
}
