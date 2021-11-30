import 'package:flutter/material.dart';

import '../components/card/todo_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final title = 'List Tile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [
            const Spacer(),
            Expanded(flex: 9, child: buildListView()),
          ],
        ));
  }
}

ListView buildListView() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return const AspectRatio(
        aspectRatio: 3 / 2,
        child: TodoCard(),
      );
    },
  );
}
/*
ListTile buildListTile() {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: AspectRatio(aspectRatio: 10 / 5, child: Image.network("https://picsum.photos/200")),
    subtitle: Container(
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("sdf"),
          SizedBox(height: Get.height * 0.03, child: const Divider()),
        ],
      ),
    ),
  );
} */
/*
   child: Padding(
              padding: const EdgeInsets.all(SpaceValue.veryLowHalf),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('left'),
                  Text('right'),
                ],
              ),
            ) */