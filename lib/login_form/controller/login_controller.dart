import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameController, emailController, passwordController;
  final _key = 'loginKey';

  //lang
  var language = Get.deviceLocale.obs;

  // Save lang GetStorage
  final String _langKey = 'lang';
  void saveLanguage(String lang) {
    box.write(_langKey, lang);
  }

  // Get lang GetStorage
  String? getLanguage() => box.read(_langKey);

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    //Get lang GetStorage, Update language
    final _langFromLocal = getLanguage();
    if (_langFromLocal != null && _langFromLocal.isNotEmpty) {
      language(Locale(_langFromLocal));
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  //Change Lang
  void changeLanguage(String? lang) {
    if (lang == null) {
      if (language.value != null && language.value!.languageCode == 'en') {
        lang = 'tr';
      } else {
        lang = 'en';
      }
    }
    // Save lang
    saveLanguage(lang);
    language(Locale(lang));
    Get.updateLocale(language.value!);
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
          password: int.parse(passwordController.text)),
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
