
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../data/provider/api/articles_api.dart';
import '../data/services/dio_client.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticlesApi(dioClient: DioClient(Get.put(Dio()))));
    Get.lazyPut<HomeController>(() => HomeController());
        // Get.put<HomeController>(HomeController());
  }
}