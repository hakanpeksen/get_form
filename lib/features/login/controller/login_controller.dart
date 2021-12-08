import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final _key = 'loginKey';
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameController, emailController, passwordController;

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

  String get name => getModel()?.name ?? '';

  void saveModel(LoginModel model) {
    box.write(_key, model.toMap());
    update();
  }

  getModel() {
    final map = box.read(_key);
    if (map != null) {
      return LoginModel.fromMap(map);
    }
    return map;
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
    saveModel(
      LoginModel(
          name: nameController.text,
          email: emailController.text,
          password: int.tryParse(passwordController.text)),
    );
    Get.snackbar(
      'login',
      'is successed',
      backgroundColor: Colors.green,
      duration: 2.seconds,
    );
    loginFormKey.currentState!.reset();
  }
}
