import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_elevatedbutton.dart';
import '../components/custom_textfield.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final objeController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (_) => ((Text('Name: ${objeController.name.toString()}',
                style: context.textTheme.headline5)))),
      ),
      body: Form(
        key: objeController.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTextField(
              hintText: 'Name',
              prefixIcon: const Icon(Icons.person),
              controller: objeController.nameController,
              keyboardType: TextInputType.text,
              validator: objeController.validateName,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email),
              controller: objeController.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: objeController.validateEmail,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              isTextObscured: true,
              controller: objeController.passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: objeController.validatePassword,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomElevatedButton(
                  label: 'Save',
                  textStyle: context.textTheme.headline6,
                  onPressed: () {
                    objeController.checkLogin();
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
