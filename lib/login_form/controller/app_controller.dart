import 'dart:async';

import 'package:get/get.dart';
import 'package:get_form/core/app_router.dart';

import '../service/app_service.dart';

class AppController extends GetxController {
  final hasLoggedIn = false.obs;
  final hasLoad = false.obs;
  final service = Get.put(AppService());

  @override
  void onInit() {
    // hasLoggedIn ? home : login
    hasLoggedIn(service.getHasLoggedIn());
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(getInitialRoute());
    });

    super.onInit();
  }

  void saveHasLoggedIn(bool val) {
    service.saveHasLoggedIn(val);
    hasLoggedIn(val);
  }

  String getInitialRoute() {
    if (hasLoggedIn.isTrue) return AppRouter.home;
    return AppRouter.login;
  }
}
