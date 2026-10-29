import 'dart:convert';

import 'package:soukamin_shop/base/abstract_service_handler.dart';
import 'package:soukamin_shop/models/product_response.dart';
import 'package:soukamin_shop/api/products.dart';

class ProductsService extends AbstractServiceHandler<void, List<Product>> {
  final ProductsApi productsApi;

  ProductsService({required this.productsApi});

  // Atajo de conveniencia: delega en execute()
  Future<List<Product>> getProducts() {
    return execute(null);
  }

  // Lógica principal: llama al API de productos y convierte la lista del JSON en objetos Product
  @override
  Future<List<Product>> doExecute(void input) async {
    final body = await productsApi.execute(null);
    final json = jsonDecode(body) as Map<String, dynamic>;
    final products = json['products'] as List<dynamic>;
    return products
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class ProductByIdService extends AbstractServiceHandler<int, Product> {
  final ProductByIdApi productByIdApi;

  ProductByIdService({required this.productByIdApi});

  // Atajo de conveniencia: delega en execute()
  Future<Product> getProductById(int id) {
    return execute(id);
  }

  // Lógica principal: llama al API y convierte el JSON en un objeto Product
  @override
  Future<Product> doExecute(int input) async {
    final body = await productByIdApi.execute(input);
    final json = jsonDecode(body) as Map<String, dynamic>;
    return Product.fromJson(json);
  }
}
