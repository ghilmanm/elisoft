import 'package:dio/dio.dart';

import '../../models/user.dart';
import '../../services/dio_exception.dart';
import '../api/auth_api.dart';

class AuthRepository {
  final AuthApi authApi;
  AuthRepository(this.authApi);

  Future<User> postLogin(String email, String password) async {
    try {
      final response = await authApi.login(email, password);
      final login = User.fromJson(response.data['user']);
      return login;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
