import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalcButton extends StatelessWidget {
  const CalcButton({Key? key, required this.buttonID, required this.onTap})
      : super(key: key);
  final String buttonID;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: buttonBorder(), width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: ElevatedButton(
          onPressed: () {
            onTap(buttonID);
          },
          child: Text(
            buttonID,
            style: TextStyle(fontSize: 20, color: buttonBorder()),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ));
  }

  Color buttonBorder() {
    if (buttonID == "=") {
      return const Color(0xFF32a852);
    } else if (buttonID == "+" ||
        buttonID == "-" ||
        buttonID == "×" ||
        buttonID == "^" ||
        buttonID == "÷") {
      return const Color.fromARGB(255, 227, 27, 27);
    } else if (buttonID == "C" ||
        buttonID == "(" ||
        buttonID == ")" ||
        buttonID == ".") {
      return const Color.fromARGB(255, 27, 80, 227);
    } else {
      return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  String getName() {
    return buttonID;
  }
}
