import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_form/tabbar/tabbar_view_v2.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_translations.dart';
import 'login_form/controller/login_controller.dart';
import 'tabbar/tabbar_view.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final appCtrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Form',
      //home: const TabBarComponent(),
      home: const TabBarViewV2(),
      translations: AppTranslations(),
      locale: appCtrl.language.value,
      fallbackLocale: const Locale('en'),
    );
  }
}
