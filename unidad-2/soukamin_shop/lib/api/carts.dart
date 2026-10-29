import 'package:soukamin_shop/base/abstract_api_handler.dart';

class ShoppingCartsApi extends AbstractApiHandler<void, String> {
  ShoppingCartsApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/carts';

  @override
  Future<String> doExecute(void input) async {
    // webClientGet maneja la petición GET y valida status >= 400
    return webClientGet(_url);
  }
}

class ShoppingCartApi extends AbstractApiHandler<int, String> {
  ShoppingCartApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/carts';

  @override
  Future<String> doExecute(int input) async {
    // webClientGet maneja la petición GET y valida status >= 400
    return webClientGet('$_url/$input');
  }
}
