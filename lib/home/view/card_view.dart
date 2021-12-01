import 'package:flutter/material.dart';

import '../components/card/xd_design_todo_cart.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Card')),
        body: Column(
          children: const [
            Expanded(flex: 6, child: Center(child: XdDesignTodoCard())),
            Spacer(),
          ],
        ));
  }
}
