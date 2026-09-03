import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final String text;
  final bool read;

  const InputCustom({super.key, required this.text, this.read = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: read,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: text,
      ),
    );
  }
}
