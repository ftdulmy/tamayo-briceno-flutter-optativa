import 'package:flutter/material.dart';
import 'package:calculadora/screens/calculadora.dart';
import 'package:calculadora/screens/buttons_screen.dart';
import 'package:calculadora/screens/item_screem.dart';
import 'package:calculadora/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: const MyApp(),
      routes: {
        '/buttons': (context) => const ButtonScreen(),
        '/calculadora': (context) => const Calculadora(),
        '/item': (context) => const ItemScreen(),
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: Scaffold(
        appBar: AppBar(title: Text('Pantalla Principal')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Calculadora(nombre: 'Juan Pérez'),
                      ),
                    );
                  },
                  child: const Text('Calculadora'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/buttons');
                  },
                  child: const Text('Pantalla 2'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/item');
                  },
                  child: const Text('Pantalla 3'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
