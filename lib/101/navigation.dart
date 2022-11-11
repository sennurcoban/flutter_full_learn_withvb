import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/button_learn.dart';

import 'navigate_detail.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return Placeholder(color: Colors.green,);
      },),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_rounded),
        onPressed: () async {final response = await navigateToWidgetNormal<bool>(context, NavigateDetailLearn());
        if (response ==true) {
          
        }
        },
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
            return widget;
          },
          fullscreenDialog: true,
          settings: RouteSettings(),),);
  }
  Future <T?>navigateToWidgetNormal<T> (BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
            MaterialPageRoute(builder: (context){
            return widget;
          },
          fullscreenDialog: true,
          settings: RouteSettings(),),);
  }
}