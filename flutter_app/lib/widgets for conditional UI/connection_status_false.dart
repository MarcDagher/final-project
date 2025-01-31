import 'package:bound_harmony/reusable%20widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class NotConnectedBox extends StatelessWidget {
  final String text;
  final String textFirstButton;
  final String textSecondButton;
  final VoidCallback handlePressedFirstButton;
  final VoidCallback handlePressedSecondButton;
  const NotConnectedBox(
      {super.key,
      required this.text,
      required this.textFirstButton,
      required this.textSecondButton,
      required this.handlePressedFirstButton,
      required this.handlePressedSecondButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Container(
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).hintColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Column(children: [
                NavigationButton(
                    text: textFirstButton,
                    textAndRightIconColor: Colors.white,
                    buttonColor: Theme.of(context).primaryColor,
                    handlePressed: handlePressedFirstButton),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: NavigationButton(
                      text: textSecondButton,
                      textAndRightIconColor: Theme.of(context).primaryColor,
                      buttonColor: Colors.white,
                      handlePressed: handlePressedSecondButton),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
