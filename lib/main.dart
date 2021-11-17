import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_form/todos/view/todos.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_router.dart';

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
      home: const TodosView(),
      getPages: AppRouter.routes,
    );
  }
}
