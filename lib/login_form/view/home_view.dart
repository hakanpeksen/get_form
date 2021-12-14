import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/app_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Get.find<AppService>();
    return Scaffold(appBar: AppBar(title: Text('Welcome  ${service.name.capitalize}')));
  }
}
