import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List<dynamic>> fetchProducts() async {
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/products"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar productos');
}

Future<dynamic> fetchProduct(int id) async {
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/products/$id"),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  throw Exception('Error al cargar el producto');
}
