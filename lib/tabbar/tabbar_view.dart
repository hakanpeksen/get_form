import 'package:flutter/material.dart';

class TabBarComponent extends StatefulWidget {
  const TabBarComponent({Key? key}) : super(key: key);

  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent> with TickerProviderStateMixin {
  final List<Tab> travel = <Tab>[
    const Tab(icon: Icon(Icons.flight)),
    const Tab(icon: Icon(Icons.directions_transit)),
    const Tab(icon: Icon(Icons.directions_car)),
    const Tab(icon: Icon(Icons.motorcycle)),
    const Tab(icon: Icon(Icons.houseboat))
  ];

  late final TabController _tabController;
  late final AnimationController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: travel.length, vsync: this);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      value: 1,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _controller.forward(from: 0.5);
      }
      // floating button click olunca selectedIndex i güncelliyor
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: travel.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text('Selected Index: ${_selectedIndex.toString()}'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  onTap: (int index) {
                    setState(() {
                      _selectedIndex = index;
                      // print(_selectedIndex);
                    });
                  },
                  isScrollable: true,
                  tabs: const [
                    Tab(child: Text('Flight')),
                    Tab(child: Text('Train')),
                    Tab(child: Text('Car')),
                    Tab(child: Text('MotoCycle')),
                    Tab(child: Text('Boat')),
                  ],
                ),
              ),
            ];
          },
          body: ScaleTransition(
            scale: _controller,
            child: TabBarView(
              controller: _tabController,
              children: const [
                Icon(Icons.flight, size: 200),
                Icon(Icons.directions_transit, size: 200),
                Icon(Icons.directions_car, size: 200),
                Icon(Icons.motorcycle, size: 200),
                Icon(Icons.houseboat, size: 200),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_right, size: 40),
            onPressed: () {
              // son index e gelince başa döner
              if (_selectedIndex == travel.length - 1) {
                _selectedIndex = -1;
              }
              // body icon geçişlerini yapar
              _tabController.animateTo(_selectedIndex += 1);
            }),
      ),
    );
  }
}
