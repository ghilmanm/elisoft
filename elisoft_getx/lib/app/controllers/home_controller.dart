import 'package:elisoft_getx/app/data/models/articles.dart';
import 'package:elisoft_getx/app/data/services/cache_manager.dart';
import 'package:get/get.dart';

import '../data/provider/repositories/articles_repository.dart';
import '../ui/utils/constants/color.dart';

class HomeController extends GetxController with CacheManager {
  final ArticlesRepository articlesRepository =
      Get.put(ArticlesRepository(Get.find()));
  final isLoading = false.obs;
  final listArticles = <Articles>[].obs;
  final user = ''.obs;

  @override
  void onInit() {
    getUser().then((value) => user.value = value.name ?? 'User not Found');
    onGetArticles();
    super.onInit();
  }

  Future<void> onGetArticles({String? userName, String? password}) async {
    isLoading.value = true;
    const durationTwoSecond = Duration(seconds: 2);
    try {
      await articlesRepository.getArticles('rachman', 'testing').then(
        (value) {
          isLoading.value = false;
          listArticles.value = value;
        },
      );
    } catch (e) {
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
