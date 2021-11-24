import 'package:flutter/material.dart';

class TabModel {
  final IconData icon;
  TabModel(this.icon);
}

class TabIconModel {
  final IconData icon;
  double size;
  TabIconModel(this.icon, {this.size = 200});
}

// 1 TabListModel 2 farklı constructor
class TabListModel {
  /// [TabModel]
  late final List<TabModel> _items;

  TabListModel() {
    _items = [
      TabModel(Icons.ac_unit),
      TabModel(Icons.directions_transit),
      TabModel(Icons.directions_car),
    ];
  }
  get items => _items.length;
  List<Tab> toWidgets() {
    return _items.map((e) => Tab(icon: Icon(e.icon))).toList();
  }

  ///BEFORE: {required List<Widget> tabs}
// tabs: const [
// Tab(icon: Icon(Icons.flight)),
// Tab(icon: Icon(Icons.directions_transit)),
// Tab(icon: Icon(Icons.directions_car)),
//  ],

  /// [TabIconModel]
  late final List<TabIconModel> _icons;

  TabListModel.icon() {
    _icons = [
      TabIconModel(Icons.ac_unit),
      TabIconModel(Icons.directions_transit),
      TabIconModel(Icons.directions_car),
    ];
  }

  List<Icon> toIconWidgets() {
    return _icons.map((e) => Icon(e.icon, size: e.size)).toList();
  }

  /// BEFORE:
  // [
  //   Icon(Icons.flight, size: 350),
  //   Icon(Icons.directions_transit, size: 350),
  //   Icon(Icons.directions_car, size: 350),
  // ],

}
