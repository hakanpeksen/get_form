import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? changedValue;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? isTextObscured;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final Function(String?)? onSaved;

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          errorStyle: const TextStyle(fontSize: 16),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
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
