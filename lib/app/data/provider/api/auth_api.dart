import 'package:dio/dio.dart';

import '../../services/dio_client.dart';

class AuthApi {
  final DioClient dioClient;
  AuthApi({required this.dioClient});

  Future<Response> login(String email, String password) async {
    try {
      final Response response = await dioClient.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
