import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculation {
  String solveEquation(String eqText) {
    List<String> charArr = eqText.split(""), numStack = [];

    /*for recursive purposes where your equation text is surrounded in unesscary brackets
  I need to remove these
  EX: (8+(2+3)) == 8+(2+3)
  */
    if (charArr[0] == "(" && charArr[charArr.length - 1] == ")") {
      charArr.removeAt(charArr.length - 1);
      charArr.removeAt(0);
    }

    //Collects numbers and operators into numStack array
    for (int i = 0; i < charArr.length; i++) {
      //DEALING WITH BRACKETS
      if (charArr[i] == "(") {
        String temp = charArr[i];
        int j = i + 1;

        //while loop is collecting the text from the open bracket and search for
        //appropriate closing bracket
        while (charArr[j] != ")" && !validateBrackets(temp)) {
          temp += charArr[j];
          j++;
        }
        temp += charArr[j];
        if (detectNegative(charArr, i)) {
          numStack.add((double.parse(solveEquation(temp)) * -1).toString());
        } else {
          numStack.add(solveEquation(temp));
        }

        i = j;
      } //end of if (brackets dealer)

      else if (isNumber(charArr[i])) {
        int k = i;
        String concatNum = "";

        if (detectNegative(charArr, i)) {
          concatNum += "-";
        }
        while (k < charArr.length && isNumber(charArr[k])) {
          //log("Running the isNumber loop");
          concatNum += charArr[k];
          //log("ConcatNum: " + concatNum);

          k++;
        }

        numStack.add(concatNum);
        i = k - 1;
      } else if (charArr[i] == "-" && i == 0 ||
          charArr[i] == "-" && !isNumber(charArr[i - 1])) {
      } else {
        numStack.add(charArr[i]);
      }
    } //end of for (CharArr)

    const opperators = ["^", "÷", "×", "+", "-"];

    /*numStack.forEach((element) {
      debugPrint(element);
    });*/

    while (numStack.length > 1) {
      // log("Reached the operators while loop");
      for (int o = 0; o < opperators.length; o++) {
        if (numStack.contains(opperators[o])) {
          int key = numStack.indexOf(opperators[o]);

          switch (opperators[o]) {
            case "+":
              numStack[key - 1] = (double.parse(numStack[key - 1]) +
                      double.parse(numStack[key + 1]))
                  .toString();
              break;
            case "-":
              numStack[key - 1] = (double.parse(numStack[key - 1]) -
                      double.parse(numStack[key + 1]))
                  .toString();
              break;
            case "×":
              numStack[key - 1] = (double.parse(numStack[key - 1]) *
                      double.parse(numStack[key + 1]))
                  .toString();
              break;
            case "÷":
              numStack[key - 1] = (double.parse(numStack[key - 1]) /
                      double.parse(numStack[key + 1]))
                  .toString();
              break;
            case "^":
              numStack[key - 1] = (pow(double.parse(numStack[key - 1]),
                      double.parse(numStack[key + 1])))
                  .toString();
              break;
            default:
            //log("Invalid operation");
          }
          numStack.removeRange(key, key + 2);
          /*numStack.forEach((element) {
            debugPrint("Final elements in numStack" + element);
          });*/
        }
      }
    } //end of while

    return numStack[0];
  }

  /*EFFECTS: Checks to see if brackets in given equation balance.
  FALSE if charArr.length is odd OR stack.length>0
  TRUE otherwise*/
  bool validateBrackets(String eqText) {
    List<String> charArr = eqText.split("");
    charArr = charArr.where((c) => c == "(" || c == ")").toList();

    if (charArr.isEmpty) {
      return true;
    } else if (charArr.length % 2 != 0) {
      return false;
    }

    List<String> stack = [];
    int top = 0;

    for (int i = 0; i < charArr.length; i++) {
      if (stack.isEmpty) {
        stack.add(charArr[i]);
        top = 0;
      } else if (stack[top] == "(" && charArr[i] == ")") {
        stack.removeAt(top);

        if (top > 0) {
          top--;
        }
      } else {
        stack.add(charArr[i]);
        top++;
      }
    } //end of for
    if (stack.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isNumber(character) {
    if (character != "÷" &&
        character != "+" &&
        character != "-" &&
        character != "×" &&
        character != "^" &&
        character != "(" &&
        character != ")") {
      return true;
    }

    return false;
  }

  bool detectNegative(List<String> arr, index) {
    if (index == 1 && arr[0] == "-" ||
        index >= 2 && arr[index - 1] == "-" && !isNumber(arr[index - 2])) {
      return true;
    }
    return false;
  }
}
