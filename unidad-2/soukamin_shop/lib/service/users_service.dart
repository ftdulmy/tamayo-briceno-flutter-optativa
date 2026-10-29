import 'dart:convert';

import 'package:soukamin_shop/base/abstract_service_handler.dart';
import 'package:soukamin_shop/api/users.dart';
import 'package:soukamin_shop/models/user_response.dart';

class LoginService
    extends AbstractServiceHandler<UserCredentialsDto, AuthResponseDto> {
  final LoginApi loginApi;

  LoginService({required this.loginApi});

  // Atajo de conveniencia: arma las credenciales y delega en execute()
  Future<AuthResponseDto> login(String username, String password) {
    final credentials = UserCredentialsDto(
      username: username,
      password: password,
    );
    return execute(credentials);
  }

  // Lógica principal: llama al API de login y convierte el JSON en AuthResponseDto
  @override
  Future<AuthResponseDto> doExecute(UserCredentialsDto input) async {
    final body = await loginApi.execute(input);
    final json = jsonDecode(body) as Map<String, dynamic>;
    return AuthResponseDto.fromJson(json);
  }
}

class UserByIdService extends AbstractServiceHandler<int, UserDto> {
  final UserByIdApi userByIdApi;

  UserByIdService({required this.userByIdApi});

  Future<UserDto> getUserById(int userId) => execute(userId);

  @override
  Future<UserDto> doExecute(int input) async {
    final body = await userByIdApi.execute(input);
    final json = jsonDecode(body) as Map<String, dynamic>;
    return UserDto.fromJson(json);
  }
}
