import 'package:flutter/material.dart';

//Optinal params
//[this.size = 200]
class TabModel {
  final IconData icon;
  double size;
  TabModel(this.icon, [this.size = 200]);
}

class TabListModel {
  late final List<TabModel> _items;

  TabListModel() {
    _items = [
      TabModel(Icons.ac_unit),
      TabModel(Icons.directions_transit),
      TabModel(Icons.directions_car),
    ];
  }
  get items => _items.length;
  // Tab Widgets
  List<Tab> toWidgets() {
    return _items.map((e) => Tab(icon: Icon(e.icon))).toList();
  }

  ///BEFORE: {required List<Widget> tabs}
// tabs: const [
// Tab(icon: Icon(Icons.flight)),
// Tab(icon: Icon(Icons.directions_transit)),
// Tab(icon: Icon(Icons.directions_car)),
//  ],

// Icon Widgets
  List<Icon> toIconWidgets() {
    return _items.map((e) => Icon(e.icon, size: e.size)).toList();
  }

  /// BEFORE:
  // [
  //   Icon(Icons.flight, size: 350),
  //   Icon(Icons.directions_transit, size: 350),
  //   Icon(Icons.directions_car, size: 350),
  // ],

}
