import 'package:flutter/material.dart';

class ButtonState extends StatefulWidget {
  const ButtonState({super.key});

  @override
  State<ButtonState> createState() => _ButtonState();
}

class _ButtonState extends State<ButtonState> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text("Sumar"),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter--;
            });
          },
          child: Text("Restar"),
        ),
        const SizedBox(height: 16),
        Text("Contador: $counter"),
      ],
    );
  }
}
