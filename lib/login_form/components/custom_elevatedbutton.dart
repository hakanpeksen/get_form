import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? label;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.label,
    this.textStyle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: const StadiumBorder(),
      ),
      child: Text(label ?? '', style: textStyle),
      onPressed: onPressed,
    );
  }
}
