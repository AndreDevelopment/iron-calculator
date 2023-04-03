import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:iron_calculator/widgets/calculation.dart';
import 'package:iron_calculator/widgets/keypad.dart';

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String eqText = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(children: [
          AutoSizeText(
            eqText,
            style: const TextStyle(fontSize: 50, color: Colors.white),
            maxLines: 1,
          ),
          Container(
              color: Colors.black,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: KeyPad(
                onTap: handleTap,
              ))
        ]));
  }

  void handleTap(buttonID) {
    if (eqText == "0") {
      eqText = "";
    }

    if (buttonID == "C") {
      eqText = "";
    } else if (buttonID == "=") {
      Calculation c = Calculation();
      c.validateBrackets(eqText)
          ? eqText = c.solveEquation(eqText)
          : eqText = "ERROR(B)";
    } else {
      eqText += buttonID;
    }
    setState(() {
      eqText;
    });
  }
}
