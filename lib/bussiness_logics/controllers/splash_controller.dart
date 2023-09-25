import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../ui/route/route.dart';


class SplashController extends GetxController {
  final box = GetStorage();

  void chooseScreen() {
    var value = box.read('user');
    if (value != null && value['uid'] != null) {
      Get.offAllNamed(bottomNav);
    } else {
      Get.offAllNamed(intro);
    }
  }

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () => chooseScreen());
    super.onInit();
  }
}
