import 'package:flutter/material.dart';
import '../../../ui/shared/text_style.dart';
import '../../../ui/shared/ui_helper.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.changedValue,
    this.hintText,
    this.prefixIcon,
    this.isTextObscured,
    this.validator,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.onSaved,
  }) : super(key: key);

  final Function(String)? changedValue;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? isTextObscured;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          errorStyle: const TextStyle(fontSize: UIHelper.space14),
          prefixIcon: prefixIcon,
          border: circleTextInputDecoration),
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: changedValue, //input da changed olmasını sağlıyor
      onTap: onTap,
      onSaved: onSaved,
      obscureText: isTextObscured ?? false,
    );
  }
}
