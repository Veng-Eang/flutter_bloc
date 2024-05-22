import 'package:flutter/material.dart';
import 'package:learn_flutter/feature/learn_flutter/dice_roller.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientBackground extends StatelessWidget {
  const GradientBackground(this.color1, this.color2, {super.key});
  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        // child: StyleText("Hello World 41"),
        child: DiceRoller(),
      ),
    );
  }
}

// class GradientBackground extends StatelessWidget {
//   const GradientBackground(this.colorGradients, {super.key});
//   final List<Color> colorGradients;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colorGradients,
//           begin: beginAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyleText("Hello World 41"),
//       ),
//     );
//   }
// }
