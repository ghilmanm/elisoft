import 'package:dio/dio.dart';
import 'package:elisoft_getx/app/data/provider/api/articles_api.dart';

import '../../models/articles.dart';
import '../../services/dio_exception.dart';

class ArticlesRepository {
  final ArticlesApi articlesApi;
  ArticlesRepository(this.articlesApi);

  Future<List<Articles>> getArticles(String userName, String password) async {
    try {
      final response = await articlesApi.articles(
          userName: userName, password: password, usernameOrEmail: "testing");
      final login = Articles().jsonToList(response.data['articles']);
      return login;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
