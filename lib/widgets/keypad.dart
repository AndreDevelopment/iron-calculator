import 'package:flutter/material.dart';

import 'package:iron_calculator/widgets/calcButton.dart';

class KeyPad extends StatefulWidget {
  KeyPad({required this.onTap});
  final onTap;
  @override
  // ignore: no_logic_in_create_state
  State<KeyPad> createState() => _KeyPadState(onTap: onTap);
}

class _KeyPadState extends State<KeyPad> {
  _KeyPadState({required this.onTap});
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) => createButtons(index),
    );
  }

  Widget createButtons(int index) {
    String name = "";
    List<String> opps = ["+", "-", "÷", "(", ")", "×", "C", ".", "=", "^"];

    if (index == 3) {
      name = opps[0];
    } else if (index == 7) {
      name = opps[1];
    } else if (index == 11) {
      name = opps[2];
    } else if (index == 12) {
      name = "9";
    } else if (index > 3 && index < 7) {
      name = (index - 1).toString();
    } else if (index > 7 && index < 11) {
      name = (index - 2).toString();
    } else if (index > 12 && index < 20) {
      name = opps[index - 10];
    } else {
      name = index.toString();
    }

    return CalcButton(
      onTap: onTap,
      buttonID: name,
    );
  }
}
