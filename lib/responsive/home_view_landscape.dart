import 'package:flutter/material.dart';

class HomeMobileLandscape extends StatelessWidget {
  const HomeMobileLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: const [Text('Drawer')],
        ),
      ),
    );
  }
}
