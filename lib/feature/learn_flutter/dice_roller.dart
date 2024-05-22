import 'dart:math';
import 'package:flutter/material.dart';

var randomNumber = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceCurrent = 1;
  rollDice() {
    setState(() {
      activeDiceCurrent = randomNumber.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$activeDiceCurrent.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28)),
          onPressed: rollDice,
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}
