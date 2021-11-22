import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_router.dart';
import 'image_picker/view/image_picker_view.dart';
import 'image_picker_v2/view/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Form',
      debugShowCheckedModeBanner: false,
      home: const Profile(),
      getPages: AppRouter.routes,
    );
  }
}
