import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
      const SplashPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        child: Text('Splash'),
      );
  }
}
