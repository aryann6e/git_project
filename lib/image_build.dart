import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class ImageBuild extends StatefulWidget {
  const ImageBuild({super.key});

  @override
  State<ImageBuild> createState() {
    return _ImageBuildState();
  }
}

class _ImageBuildState extends State<ImageBuild> {
  var currentDiceNumber = 2;

  void rollDice() {
    var diceNumber = randomizer.nextInt(6) + 1;
    setState(() {
      currentDiceNumber = diceNumber;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$currentDiceNumber.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
// padding: const EdgeInsets.only(top: 20),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          onPressed: rollDice,
          child: const Text('ROLL DICE'),
        )
      ],
    );
  }
}
