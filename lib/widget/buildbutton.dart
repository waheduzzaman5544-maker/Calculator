import 'package:flutter/material.dart';
class buildButton extends StatelessWidget {
  final String text;
  final Color ? color;
  final VoidCallback onclick;
  const buildButton({
    super.key,
    required this.text,
    required this.onclick,
    this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? const Color.fromARGB(152, 102, 94, 94),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20)),
          onPressed: onclick,
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 190, 243, 15)),
          ),
        ),
      ),
    );
  }
}