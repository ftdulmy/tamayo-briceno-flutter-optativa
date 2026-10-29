import 'package:soukamin_shop/base/abstract_api_handler.dart';
import 'package:soukamin_shop/models/user_response.dart';

class LoginApi extends AbstractApiHandler<UserCredentialsDto, String> {
  LoginApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/auth/login';

  @override
  Future<String> doExecute(UserCredentialsDto input) async {
    // webClientPost maneja la petición POST y valida status >= 400
    return await webClientPost(_url, input.toJson());
  }
}

class UserByIdApi extends AbstractApiHandler<int, String> {
  UserByIdApi({required super.httpClient});

  static const String _url = 'https://dummyjson.com/users';

  @override
  Future<String> doExecute(int input) {
    return webClientGet('$_url/$input');
  }
}
