import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/themes/text_h1.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.store),
                  const SizedBox(width: 8.0),
                  Text(style: textH1Theme, "TIENDA EXAMEN"),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomInput(controller: user, labelText: "Usuario/Correo"),
              const SizedBox(height: 16.0),
              CustomInput(controller: password, labelText: "Contraseña"),
              const SizedBox(height: 16.0),
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
      ),
    );
  }
}
