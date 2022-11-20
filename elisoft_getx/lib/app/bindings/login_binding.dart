import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../data/provider/api/auth_api.dart';
import '../data/services/dio_client.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthApi(dioClient: DioClient(Get.put(Dio()))));
    Get.lazyPut<LoginController>(() => LoginController());
    // Get.put<LoginController>(LoginController());
  }
}
