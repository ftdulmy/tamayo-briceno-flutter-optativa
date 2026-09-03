import 'package:calculadora/widgets/custom_input.dart';
import 'package:calculadora/widgets/number_button.dart';
import 'package:calculadora/widgets/action_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController num1 = TextEditingController();
    TextEditingController num2 = TextEditingController();
    TextEditingController result = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomInput(controller: num1, labelText: 'Número 1'),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomInput(controller: num2, labelText: 'Número 2'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: CustomInput(
                  readOnly: true,
                  controller: result,
                  labelText: 'Resultado',
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '1',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '2',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '3',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '4',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '5',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '6',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '7',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '8',
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: NumberButton(
                      controller: num1,
                      controller2: num2,
                      labelNumber: '9',
                    ),
                  ),
                ],
              ),
              Center(
                child: NumberButton(
                  controller: num1,
                  controller2: num2,
                  labelNumber: '0',
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ActionButton(
                  result: result,
                  number1: num1,
                  number2: num2,
                  labelAction: 'CLEAR',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
