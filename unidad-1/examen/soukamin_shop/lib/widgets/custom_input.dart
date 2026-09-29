import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomInput({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}
