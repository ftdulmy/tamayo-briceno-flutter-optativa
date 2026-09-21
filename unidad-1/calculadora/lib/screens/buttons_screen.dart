import 'package:calculadora/widgets/button_read.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla 2')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ButtonRead(labelString: 'Botón 1', readOnly: false),
            const SizedBox(height: 16.0),
            ButtonRead(labelString: 'Botón 2', readOnly: false),
            const SizedBox(height: 16.0),
            ButtonRead(labelString: 'Botón 3', readOnly: false),
            const SizedBox(height: 16.0),
            ButtonRead(labelString: 'Botón 4', readOnly: false),
            const SizedBox(height: 16.0),
            ButtonRead(labelString: 'Botón 5', readOnly: false),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
