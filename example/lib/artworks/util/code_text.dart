import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/xcode.dart';
import 'package:highlight/languages/dart.dart';

class CodeText extends StatefulWidget {
  const CodeText(this.code, {Key? key}) : super(key: key);

  final String code;

  @override
  State<CodeText> createState() => _CodeTextState();
}

class _CodeTextState extends State<CodeText> {
  late final CodeController codeController;

  @override
  void initState() {
    super.initState();
    codeController = CodeController(
      params: const EditorParams(tabSpaces: 4),
      text: widget.code.trim(),
      language: dart,
      theme: xcodeTheme,
    );
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    codeController.text = widget.code.trim();
    return CodeField(
      background: Colors.grey[200],
      controller: codeController,
    );
  }
}
