import 'package:basic_inteface/widgets/button_state.dart';
import 'package:basic_inteface/widgets/custom_input.dart';
import 'package:basic_inteface/widgets/form.dart';
import 'package:basic_inteface/widgets/number.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primera app'),
          backgroundColor: const Color.fromARGB(255, 6, 9, 166),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InputCustom(text: 'Nombre', read: true),
              const SizedBox(height: 16),
              InputCustom(text: 'Correo electrónico', read: false),
              const SizedBox(height: 16),
              ButtonState(),
              const SizedBox(height: 16),
              FormWidget(),
              NumberCustom(
                value: 5,
                onPressed: (value) {
                  print('Número presionado: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
