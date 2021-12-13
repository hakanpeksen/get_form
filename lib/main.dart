import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_router.dart';
import 'login_form/controller/app_controller.dart';
import 'login_form/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInit();
  runApp(const MyApp());
}

Future<void> appInit() async {
  await GetStorage.init();
  // app in ilk açılışı için önemli
  Get.put(AppController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => GetMaterialApp(
        title: 'Get Form',
        debugShowCheckedModeBanner: false,
        getPages: AppRouter.routes,
        home: const SplashView(),
      ),
    );
  }
}

//  BEFORE
 // final appCtrl = Get.find<AppController>();
 ////initialRoute: appCtrl.getInitialRoute(),