import 'package:flutter/material.dart';
import 'package:get/get.dart';

dialogLoading() {
  return Get.dialog(
    const Center(child: CircularProgressIndicator()),
    barrierDismissible: false,
  );
}