import 'package:flutter/material.dart';
import 'package:soukamin_shop/screens/login_screen.dart';
import 'package:soukamin_shop/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.themeData, home: LoginScreen());
  }
}
