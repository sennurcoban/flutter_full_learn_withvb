import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/feed_view.dart';

import '../101/button_learn.dart';
import '../101/icon_learn.dart';

class TabbarAdvance extends StatefulWidget {
  const TabbarAdvance({super.key});

  @override
  State<TabbarAdvance> createState() => _TabbarAdvanceState();
}

class _TabbarAdvanceState extends State<TabbarAdvance> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(_MyTabViews.home.index);
            },
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            child: _myTabView(),
          ),
          appBar: AppBar(),
          body: _tabbarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: '${e.name}',
                ))
            .toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [FeedView(), IconLearnView(), ButtonLearn(), IconLearnView()]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
