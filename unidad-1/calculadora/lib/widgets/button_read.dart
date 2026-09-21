import 'package:flutter/material.dart';

class ButtonRead extends StatefulWidget {
  final String labelString;
  final bool readOnly;

  const ButtonRead({
    super.key,
    required this.labelString,
    required this.readOnly,
  });

  @override
  State<ButtonRead> createState() => _ButtonReadState();
}

class _ButtonReadState extends State<ButtonRead> {
  void setValue() {
    if (!widget.readOnly) {
      // Acción a realizar cuando el botón no es de solo lectura
      final snackBar = SnackBar(
        content: Text('Botón presionado: ${widget.labelString}'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: setValue, child: Text(widget.labelString));
  }
}
