import 'package:soukamin_shop/base/abstract_api_handler.dart';

class ProductsApi extends AbstractApiHandler<void, String> {
  ProductsApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/products';

  @override
  Future<String> doExecute(void input) {
    // webClientGet maneja la petición GET y valida status >= 400
    return webClientGet(_url);
  }
}

class ProductByIdApi extends AbstractApiHandler<int, String> {
  ProductByIdApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/products';

  @override
  Future<String> doExecute(int input) async {
    // webClientGet maneja la petición GET y valida status >= 400
    return webClientGet('$_url/$input');
  }
}
