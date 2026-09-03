import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final TextEditingController result;
  final TextEditingController number1;
  final TextEditingController number2;
  final String labelAction;

  const ActionButton({
    super.key,
    required this.result,
    required this.number1,
    required this.number2,
    required this.labelAction,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  void setAction() {
    if (widget.labelAction == "CLEAR") {
      widget.result.clear();
      widget.number1.clear();
      widget.number2.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: setAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      child: Text(widget.labelAction),
    );
  }
}
