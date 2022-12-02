import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/303/feed_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/product/constant/project_items.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';
import 'package:provider/provider.dart';
import '101/color_learn.dart';
import '101/navigation.dart';
import '303/lottie_learn.dart';
import '303/mobx_image_picker/view/mobx_image_upload_view.dart';
import '303/navigator/navigate_home_detail_view.dart';
import '303/navigator/navigator_manager.dart';

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

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      debugShowCheckedModeBanner: false,
      // theme: context.watch<ThemeNotifier>().currentTheme,
      theme: ThemeData.dark().copyWith(
          tabBarTheme: const TabBarTheme(
              labelColor: Colors.white, unselectedLabelColor: Colors.red, indicatorSize: TabBarIndicatorSize.label),
          bottomAppBarTheme: const BottomAppBarTheme(
            shape: CircularNotchedRectangle(),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.white,
          ),
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero), //tüm paddingleri sıfıra çeker
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          errorColor: ColorsItems.sulu,
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Colors.red,
            cursorColor: Colors.green,
            selectionHandleColor: Colors.black,
          ),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              // fillColor: Colors.white,
              iconColor: Colors.red,
              labelStyle: TextStyle(color: Colors.lime),
              border: OutlineInputBorder(),
              floatingLabelStyle: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              )),
          // textTheme: TextTheme(subtitle1: TextStyle(color: Colors.red)),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          )),

      // initialRoute: '/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return LottieLearn();
          },
        );
      },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManagement.instance.navigatorGlobalKey,
      home: MobxImageUpload(),
      // home:StatefullLifeCycle(message: "sennurrr",),
    );
  }
}
