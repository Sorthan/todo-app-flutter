import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SecurityPage extends StatelessWidget {
  SecurityPage({Key? key}) : super(key: key);

  List<String> currentPin = ["", "", "", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.white),
  );

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final keyboardHeight = screenSize.height > screenSize.width
        ? screenSize.height / 2
        : screenSize.height - 80;
    final keyboardWidth = keyboardHeight * 4 / 5;
    final itemSize = keyboardWidth / 3;
    const maxItemSize = 300 * 0.25;
    const textStyle = TextStyle(
      fontSize: maxItemSize - (maxItemSize * .37),
      color: Colors.white,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: SafeArea(
          child: Wrap(
            runSpacing: 2,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Passcode",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  _buildUnlockPin(),
                  const Padding(padding: EdgeInsets.all(50)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.from(
                      [1, 2, 3].map(
                        (index) => Container(
                          width: itemSize,
                          height: itemSize,
                          constraints: const BoxConstraints(
                            maxHeight: maxItemSize,
                            maxWidth: maxItemSize,
                          ),
                          child:
                              _buildKeyboardDigit(index.toString(), textStyle),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.from(
                      [4, 5, 6].map(
                        (index) => Container(
                          width: itemSize,
                          height: itemSize,
                          constraints: const BoxConstraints(
                            maxHeight: maxItemSize,
                            maxWidth: maxItemSize,
                          ),
                          child:
                              _buildKeyboardDigit(index.toString(), textStyle),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.from(
                      [7, 8, 9].map(
                        (index) => Container(
                          width: itemSize,
                          height: itemSize,
                          constraints: const BoxConstraints(
                            maxHeight: maxItemSize,
                            maxWidth: maxItemSize,
                          ),
                          child:
                              _buildKeyboardDigit(index.toString(), textStyle),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.from(
                      [0].map(
                        (index) => Container(
                          width: itemSize,
                          height: itemSize,
                          constraints: const BoxConstraints(
                            maxHeight: maxItemSize,
                            maxWidth: maxItemSize,
                          ),
                          child:
                              _buildKeyboardDigit(index.toString(), textStyle),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(50)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Emergency",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          clearPin();
                        },
                        child: const Text(
                          "Cancel",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnlockPin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PasscodeDot(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PasscodeDot(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PasscodeDot(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PasscodeDot(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
        PasscodeDot(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFiveController,
        ),
        PasscodeDot(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinSixController,
        ),
      ],
    );
  }

  Widget _buildKeyboardDigit(String text, TextStyle textStyle) {
    return ClipOval(
      child: ElevatedButton(
        onPressed: () {
          pinIndexSetup(text);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromRGBO(255, 118, 129, 1),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    // ignore: unused_local_variable
    String strPin = "";
    // ignore: avoid_function_literals_in_foreach_calls
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 6) {
      if (currentPin[0] == "6" &&
          currentPin[1] == "3" &&
          currentPin[2] == "1" &&
          currentPin[3] == "2" &&
          currentPin[4] == "3" &&
          currentPin[5] == "1") {
        currentPin.isEmpty;
        pinOneController.clear();
        pinTwoController.clear();
        pinThreeController.clear();
        pinFourController.clear();
        pinFiveController.clear();
        pinSixController.clear();
        Get.toNamed('todo');
      }
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }
}

class PasscodeDot extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  // ignore: prefer_const_constructors_in_immutables
  PasscodeDot(
      {Key? key,
      required this.textEditingController,
      required this.outlineInputBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(2),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30,
        ),
        obscureText: true,
        style: const TextStyle(
          fontSize: 8,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
