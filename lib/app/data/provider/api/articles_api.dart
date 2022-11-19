import 'package:dio/dio.dart';

import '../../services/dio_client.dart';

class ArticlesApi {
  final DioClient dioClient;
  ArticlesApi({required this.dioClient});

  Future<Response> articles(
      {String? userName, String? password, String? usernameOrEmail}) async {
    try {
      final Response response = await dioClient.get(
        'articles?userName=$userName&password=$password&usernameOrEmail=$usernameOrEmail',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
