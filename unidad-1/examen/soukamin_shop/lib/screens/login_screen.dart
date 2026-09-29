import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/widgets/bottom_nav_bar.dart';
import 'package:soukamin_shop/widgets/custom_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(children: [Icon(Icons.shop), Text("TIENDA EXAMEN")]),
            Expanded(
              child: CustomInput(controller: user, labelText: "Usuario/Correo"),
            ),
            Expanded(
              child: CustomInput(controller: password, labelText: "Contraseña"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigatorBar(),
                  ),
                );
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
