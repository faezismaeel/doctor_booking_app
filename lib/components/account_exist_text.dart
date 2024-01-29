import 'package:flutter/material.dart';

class AccountExistText extends StatelessWidget {
  const AccountExistText({
    super.key, required this.press, required this.text, required this.buttonText,
  });
  final String text,buttonText;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text(text),
       InkWell(
        onTap: press,
        child:  Text(buttonText,
        style: const TextStyle(
          color: Colors.deepPurple
        ),
        )),
          
      ],
    );
  }
}