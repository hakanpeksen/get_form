import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_model.dart';
import '../service/app_service.dart';
import 'app_controller.dart';

class LoginController extends GetxController {
  final appCtrl = Get.put(AppController());
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameController, emailController, passwordController;
  final service = Get.put(AppService());

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateName(String? value) {
    if (value != null && value.isNotEmpty) return null;
    return "Name not Empty";
  }

  String? validateEmail(String? value) {
    if (value != null && GetUtils.isEmail(value)) return null;
    return "Provide valid Email";
  }

  String? validatePassword(String? value) {
    if (value != null && value.isNotEmpty && value.length > 5) return null;
    return "Password must be of 6 characters";
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) return;
    loginFormKey.currentState!.save();
    appCtrl.saveHasLoggedIn(true);
    Get.offAllNamed(appCtrl.getInitialRoute());
    service.saveLoginModel(
      LoginModel(
          name: nameController.text,
          email: emailController.text,
          password: int.tryParse(passwordController.text)),
    );
    Get.snackbar(
      'login',
      'is successed',
      backgroundColor: Colors.green,
      duration: 1.seconds,
    );
    loginFormKey.currentState!.reset();
  }
}
