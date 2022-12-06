import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/product/constant/project_items.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/navigator/navigator_custom.dart';
import 'package:provider/provider.dart';
import '101/color_learn.dart';
import '303/lottie_learn.dart';
import '303/navigator/navigator_manager.dart';
import '404/bloc/future/login/view/login_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => const MyApp(),
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
            return const LottieLearn();
          },
        );
      },
      // builder: (context, widget) {

      // },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManagement.instance.navigatorGlobalKey,
      home: const LoginView(),
      // home:StatefullLifeCycle(message: "sennurrr",),
    );
  }
}
