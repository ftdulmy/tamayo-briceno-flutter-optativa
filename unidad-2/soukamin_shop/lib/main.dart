import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/screens/login_screen.dart';
import 'package:soukamin_shop/service/users_service.dart';
import 'package:soukamin_shop/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final http.Client _httpClient = http.Client();
  late final LoginService _loginService = LoginService(
    loginApi: LoginApi(httpClient: _httpClient),
  );

  @override
  void dispose() {
    _httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: LoginScreen(loginService: _loginService),
    );
  }
}
