import 'package:flutter/material.dart';

class NumberCustom extends StatelessWidget {
  final int value;
  final ValueChanged<int>? onPressed;

  const NumberCustom({super.key, required this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!(value);
        }
      },
      child: Text(value.toString()),
    );
  }
}
