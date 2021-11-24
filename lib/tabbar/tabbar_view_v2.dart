import 'package:flutter/material.dart';
import 'package:get_form/model/tab_model.dart';

BoxDecoration indicatorDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20), // Creates border
    color: Colors.greenAccent);

class TabBarViewV2 extends StatelessWidget {
  const TabBarViewV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: TabListModel().items,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                indicatorColor: Colors.amberAccent,
                indicatorWeight: 5,
                // isScrollable: true,
                indicator: indicatorDecoration,
                tabs: TabListModel().toWidgets()),
          ),
          body: TabBarView(children: TabListModel.icon().toIconWidgets()),
        ));
  }
}
