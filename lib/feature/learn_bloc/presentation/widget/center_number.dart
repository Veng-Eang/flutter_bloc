import 'package:flutter/material.dart';

class CenterNumber extends StatelessWidget {
  const CenterNumber(this.number, {super.key});
  final int number;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
