import 'package:flutter/material.dart';
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/themes/app_theme.dart';
import 'package:soukamin_shop/widgets/bottom_nav_bar.dart';
import 'package:soukamin_shop/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();

    Future<void> iniciarSesion() async {
      if (user.text.trim().isEmpty || password.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rellena todos los campos')),
        );
        return;
      }
      try {
        await loginUser(username: user.text.trim(), password: password.text);

        if (!context.mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigatorBar()),
        );
      } catch (e) {
        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario o contraseña incorrectas')),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.store),
                  const SizedBox(width: 8.0),
                  Text(style: AppTheme.textH1, "TIENDA EXAMEN"),
                ],
              ),
              const SizedBox(height: 16.0),
              CustomInput(controller: user, labelText: "Usuario/Correo"),
              const SizedBox(height: 16.0),
              CustomInput(controller: password, labelText: "Contraseña"),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: iniciarSesion,
                child: const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
