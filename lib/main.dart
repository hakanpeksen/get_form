import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'home/view/card_view.dart';
import 'theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => GetMaterialApp(
        title: 'Get Form',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const CardView(),
      ),
    );
  }
}

  /// import 'package:get_form/features/home_view.dart';
  // home: const HomeView(),

  //  import 'features/grid_home_view.dart';
  // home: const GridHomeView(),