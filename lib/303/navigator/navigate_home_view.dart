import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/navigator/navigator_manager.dart';
import 'package:flutter_full_learn/product/mixin/navigator_mixin.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          child: Icon(Icons.abc_rounded),
          onPressed: () async {
            router.pushToPage(NavigateRoutes.detail, arguments: "senn");

            //singletonla context olmadan navigator işlemlerimizi yaptık
            // await NavigatorManagement.instance.pushToPage(NavigateRoutes.detail, arguments: "senn");
            // Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaghf, arguments: "abc");
          }),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}
