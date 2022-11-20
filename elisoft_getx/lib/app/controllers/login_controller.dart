import 'package:elisoft_getx/app/data/services/cache_manager.dart';
import 'package:elisoft_getx/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../data/provider/repositories/auth_repository.dart';
import '../ui/global_widgets/dialog_loading.dart';
import '../ui/utils/constants/color.dart';

class LoginController extends GetxController with CacheManager {
  final AuthRepository authRepository = Get.put(AuthRepository(Get.find()));
  final isObscure = true.obs;
  final isLoading = false.obs;

  Future<void> onLogin(String email, String password) async {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    dialogLoading();
    isLoading.value = true;
    const durationTwoSecond = Duration(seconds: 2);
    try {
      var response = await authRepository.postLogin(email, password);
      if (Get.isDialogOpen == true) {
        Get.back(closeOverlays: true);
      }
      isLoading.value = false;
      Get.snackbar(
        'Berhasil',
        'Login Succes!',
        colorText: TEXT_ICONS_COLOR,
        backgroundColor: SUCCESS_COLOR,
        duration: durationTwoSecond,
      );
      await removeUser();
      saveUser(response).then((value) => Get.toNamed(AppRoutes.HOME));
    } catch (e) {
      if (Get.isDialogOpen == true) {
        Get.back(closeOverlays: true);
      }
      isLoading.value = false;
      Get.snackbar(
        'Gagal',
        e.toString(),
        colorText: TEXT_ICONS_COLOR,
        backgroundColor: DANGER_COLOR,
        duration: durationTwoSecond,
      );
    }
  }
}
