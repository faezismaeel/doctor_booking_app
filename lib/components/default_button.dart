import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.press});

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(198, 159, 119, 253)
        ),
        onPressed: press,
        child: Text(text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
        ),
      ),
    );
  }
}