import 'package:http/http.dart' as http;

import 'dart:convert';

Future<dynamic> fetchUser(int id) async {
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/users/$id"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar el usuario');
}

Future<String> loginUser({
  required String username,
  required String password,
}) async {
  final response = await http.post(
    Uri.parse("https://fakestoreapi.com/auth/login"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  print('Status: ${response.statusCode}');
  print('Respuesta: ${response.body}');

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data['token'];
  }
  throw Exception('Error al iniciar sesión');
}
