import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/shared/text_style.dart';
import '../controller/login_controller.dart';

final applogin = Get.find<LoginController>();

class PasswordFormField extends TextFormField {
  PasswordFormField(
      {Key? key,
      required String label,
      required String? Function(String?)? validator,
      required TextEditingController textEditingController})
      : super(
            key: key,
            obscureText: applogin.isSecureText.value,
            validator: validator,
            decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                border: circleTextInputDecoration,
                suffixIcon: IconButton(
                    onPressed: applogin.changeSecure,
                    icon: Icon(
                        applogin.isSecureText.value ? Icons.visibility : Icons.visibility_off))),
            controller: textEditingController);
}
