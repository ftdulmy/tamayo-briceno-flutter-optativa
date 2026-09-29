import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List<dynamic>> fetchCarts() async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/carts"));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar usuarios');
}

Future<dynamic> fetchCart(int id) async {
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/cart/$id"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar los carritos');
}
