import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../product/utility/grid/grid_util.dart';
import '../product/widget_height.dart';

class GridHomeView extends StatelessWidget {
  const GridHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid'),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Text('hello', style: Get.textTheme.headline4)),
        SliverToBoxAdapter(child: SizedBox(height: WidgetHeight.card.rawValue())),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const Card();
            }, childCount: 3),
            gridDelegate: HomePageGridDelegate())
      ]),
    );
  }
}
