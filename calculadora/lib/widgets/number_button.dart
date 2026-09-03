import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController controller2;
  final String labelNumber;

  const NumberButton({
    super.key,
    required this.controller,
    required this.controller2,
    required this.labelNumber,
  });

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    void setNumber() {
      widget.controller.text += widget.labelNumber;
    }

    return ElevatedButton(
      onPressed: setNumber,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      child: Text(widget.labelNumber),
    );
  }
}
