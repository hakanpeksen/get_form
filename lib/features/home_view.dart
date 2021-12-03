import 'package:flutter/material.dart';

import '../constants/image_constants.dart';
import '../product/utility/radius/rounded_clip_rect.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Center(
        child: CustomRoundedClipRect(child: Image.asset(ImageConstants.instance.matthew)),
      ),
    );
  }
}
