import 'package:flutter/material.dart';

// Class Method
class CustomRoundedClipRect extends ClipRRect {
  CustomRoundedClipRect({Key? key, required Widget child})
      : super(key: key, borderRadius: BorderRadius.circular(30), child: child);
}
