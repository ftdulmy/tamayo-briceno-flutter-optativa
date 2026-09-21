import 'package:calculadora/widgets/action_button.dart';
import 'package:calculadora/widgets/custom_input.dart';
import 'package:calculadora/widgets/number_button.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  final String? nombre;
  const Calculadora({super.key, this.nombre});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String paramsNombre = nombre ?? args?['nombre'] ?? 'Desconocido';

    TextEditingController num1 = TextEditingController();
    TextEditingController num2 = TextEditingController();
    TextEditingController result = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Text('Nombre: $paramsNombre')),
            const SizedBox(height: 16.0),
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
              child: Expanded(
                child: NumberButton(
                  controller: num1,
                  controller2: num2,
                  labelNumber: '0',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Expanded(
                child: ActionButton(
                  result: result,
                  number1: num1,
                  number2: num2,
                  labelAction: 'CLEAR',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    result: result,
                    number1: num1,
                    number2: num2,
                    labelAction: '+',
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ActionButton(
                    result: result,
                    number1: num1,
                    number2: num2,
                    labelAction: '-',
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ActionButton(
                    result: result,
                    number1: num1,
                    number2: num2,
                    labelAction: '*',
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ActionButton(
                    result: result,
                    number1: num1,
                    number2: num2,
                    labelAction: '/',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
