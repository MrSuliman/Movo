import 'package:flutter/material.dart';
import '../../core/utils/consts.dart';

class Button extends StatelessWidget {
  const Button({required this.text, Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Consts.kColor,
        minimumSize: const Size(90, 38),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
