import 'dart:convert';

import 'package:soukamin_shop/base/abstract_service_handler.dart';
import 'package:soukamin_shop/api/carts.dart';
import 'package:soukamin_shop/models/cart_response.dart';

class ShoppingCartsService
    extends AbstractServiceHandler<void, List<ShoppingCart>> {
  final ShoppingCartsApi shoppingCartsApi;

  ShoppingCartsService({required this.shoppingCartsApi});

  Future<List<ShoppingCart>> getCarts() => execute(null);

  @override
  Future<List<ShoppingCart>> doExecute(void input) async {
    final body = await shoppingCartsApi.execute(null);
    final json = jsonDecode(body) as Map<String, dynamic>;
    final carts = json['carts'] as List<dynamic>;

    return carts
        .map((item) => ShoppingCart.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class ShoppingCartService extends AbstractServiceHandler<int, ShoppingCart> {
  final ShoppingCartApi shoppingCartApi;

  ShoppingCartService({required this.shoppingCartApi});

  Future<ShoppingCart> getCartById(int cartId) {
    return execute(cartId);
  }

  @override
  Future<ShoppingCart> doExecute(int input) async {
    final body = await shoppingCartApi.execute(input);
    final json = jsonDecode(body) as Map<String, dynamic>;
    return ShoppingCart.fromJson(json);
  }
}
