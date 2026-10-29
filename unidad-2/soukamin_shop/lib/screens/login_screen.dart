import 'package:flutter/material.dart';
import 'package:soukamin_shop/service/users_service.dart';
import 'package:soukamin_shop/themes/app_theme.dart';
import 'package:soukamin_shop/widgets/bottom_nav_bar.dart';
import 'package:soukamin_shop/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  final LoginService loginService;

  const LoginScreen({super.key, required this.loginService});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _iniciarSesion() async {
    if (_userController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rellena todos los campos')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await widget.loginService.login(
        _userController.text.trim(),
        _passwordController.text,
      );

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNavigatorBar()),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo iniciar sesión: $error')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              CustomInput(
                controller: _userController,
                labelText: "Usuario/Correo",
              ),
              const SizedBox(height: 16.0),
              CustomInput(
                controller: _passwordController,
                labelText: "Contraseña",
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _iniciarSesion,
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
