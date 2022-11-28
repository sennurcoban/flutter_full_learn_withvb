import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';
import '101/color_learn.dart';
import '202/alert_learn.dart';
import '202/animated_learn_view.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/cache/shared_learn_cache.dart';
import '202/cache/shared_list_cache.dart';
import '202/form_learn_view.dart';
import '202/oop_learn_view.dart';
import '202/sheet_learn.dart';
import '202/theme/light_theme.dart';
import '303/callback_learn.dart';
import '303/reqres_resource/view/req_res_view.dart';
import '303/tabbar_advance.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      // theme: ThemeData.dark().copyWith(
      //     tabBarTheme: const TabBarTheme(
      //         labelColor: Colors.white, unselectedLabelColor: Colors.red, indicatorSize: TabBarIndicatorSize.label),
      //     bottomAppBarTheme: const BottomAppBarTheme(
      //       shape: CircularNotchedRectangle(),
      //     ),
      //     progressIndicatorTheme: const ProgressIndicatorThemeData(
      //       color: Colors.white,
      //     ),
      //     listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero), //tüm paddingleri sıfıra çeker
      //     cardTheme: CardTheme(
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //     ),
      //     errorColor: ColorsItems.sulu,
      //     textSelectionTheme: const TextSelectionThemeData(
      //       selectionColor: Colors.red,
      //       cursorColor: Colors.green,
      //       selectionHandleColor: Colors.black,
      //     ),
      //     inputDecorationTheme: const InputDecorationTheme(
      //         filled: true,
      //         // fillColor: Colors.white,
      //         iconColor: Colors.red,
      //         labelStyle: TextStyle(color: Colors.lime),
      //         border: OutlineInputBorder(),
      //         floatingLabelStyle: TextStyle(
      //           color: Colors.red,
      //           fontSize: 24,
      //           fontWeight: FontWeight.w300,
      //         )),
      //     // textTheme: TextTheme(subtitle1: TextStyle(color: Colors.red)),
      //     appBarTheme: const AppBarTheme(
      //       centerTitle: true,
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       systemOverlayStyle: SystemUiOverlayStyle.light,
      //     )),
      home: const ReqresView(),
      // home:StatefullLifeCycle(message: "sennurrr",),
    );
  }
}
