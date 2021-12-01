import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.green,
        shape: const StadiumBorder(),
      ),
      child: Text(label, style: AppTextStyles.h6),
      onPressed: onPressed,
    );
  }
}
