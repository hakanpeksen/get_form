import 'package:flutter/material.dart';
import '../../ui/shared/text_style.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: submitButtonColor,
        shape: const StadiumBorder(),
      ),
      child: Text(label, style: context.textTheme.headline6),
      onPressed: onPressed,
    );
  }
}
