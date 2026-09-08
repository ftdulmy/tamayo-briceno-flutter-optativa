import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _controller = TextEditingController();
  String _inputValue = '';

  setStateInput() {
    setState(() {
      String inputText = _controller.text.trim();

      if (inputText.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor ingresa un valor'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      _inputValue = _controller.text;
    });
  }

  setStateClear() {
    setState(() {
      _controller.clear();
      _inputValue = '';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(labelText: 'Enter your name'),
        ),
        ElevatedButton(onPressed: setStateInput, child: const Text("Guardar")),
        ElevatedButton.icon(
          onPressed: setStateClear,
          icon: const Icon(Icons.clear),
          label: const Text("Limpiar"),
        ),
        Text("Valor ingresado: $_inputValue"),
      ],
    );
  }
}
