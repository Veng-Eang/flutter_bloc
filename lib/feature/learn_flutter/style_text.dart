import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.outputText, {super.key});

  final String outputText;

  @override
  Widget build(context) {
    return Text(
      outputText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28.0,
      ),
    );
  }
}
