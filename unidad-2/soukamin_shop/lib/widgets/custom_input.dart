import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const CustomInput({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
    );
  }
}
