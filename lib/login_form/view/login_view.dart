import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/shared/ui_helper.dart';
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
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: objeController.loginFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(UIHelper.space15),
            child: Column(children: [
              CustomTextField(
                hintText: 'Name',
                prefixIcon: const Icon(Icons.person),
                controller: objeController.nameController,
                keyboardType: TextInputType.text,
                validator: objeController.validateName,
              ),
              UIHelper.verticalSpace,
              CustomTextField(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                controller: objeController.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: objeController.validateEmail,
              ),
              UIHelper.verticalSpace,
              CustomTextField(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                isTextObscured: true,
                controller: objeController.passwordController,
                keyboardType: TextInputType.visiblePassword,
                validator: objeController.validatePassword,
              ),
              UIHelper.verticalSpace,
              SizedBox(
                height: UIHelper.dynamicHeight(UIHelper.space50),
                width: double.infinity,
                child: CustomElevatedButton(
                    label: 'Submit',
                    onPressed: () {
                      objeController.checkLogin();
                      FocusScope.of(context).requestFocus(FocusNode());
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
