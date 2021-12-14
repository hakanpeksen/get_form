import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../ui/shared/ui_helper.dart';
import '../components/custom_elevatedbutton.dart';
import '../components/custom_textfield.dart';
import '../components/password_form_field.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // AppController da onInit de route lar silindiği için Get.put kullanıldı
    // Get.find hata aldı
    final applogin = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        top: false,
        bottom: false,
        child: buildForm(applogin, context),
      ),
    );
  }

  Form buildForm(LoginController applogin, BuildContext context) {
    return Form(
      key: applogin.loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.h),
          child: Column(children: [
            CustomTextField(
              labelText: 'Name',
              hintText: 'Name',
              prefixIcon: const Icon(Icons.person),
              controller: applogin.nameController,
              keyboardType: TextInputType.text,
              validator: applogin.validateName,
            ),
            UIHelper.verticalSpace,
            CustomTextField(
                labelText: 'Email',
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                controller: applogin.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: applogin.validateEmail),
            UIHelper.verticalSpace,
            Obx(() => PasswordFormField(
                  label: 'Password',
                  textEditingController: applogin.passwordController,
                  validator: applogin.validatePassword,
                )),
            UIHelper.verticalSpace,
            SizedBox(
              height: 40.h,
              width: double.infinity,
              child: CustomElevatedButton(
                  label: 'Submit',
                  onPressed: () {
                    applogin.checkLogin();
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
