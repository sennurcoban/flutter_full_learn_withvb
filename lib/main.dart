import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '101/color_learn.dart';
import '101/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white,),
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero), //tüm paddingleri sıfıra çeker
        cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
        errorColor: ColorsItems.sulu,
        textSelectionTheme:const  TextSelectionThemeData(
          selectionColor: Colors.red, cursorColor: Colors.green, selectionHandleColor: Colors.black,
        ),
        inputDecorationTheme: const  InputDecorationTheme(
          filled: true,
          // fillColor: Colors.white,
          iconColor: Colors.red,
          labelStyle: TextStyle(color:Colors.lime),
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w300, )
        ),
        // textTheme: TextTheme(subtitle1: TextStyle(color: Colors.red)),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        )),
      home:const NavigationLearn(),
      // home:StatefullLifeCycle(message: "sennurrr",),
    );
  }
}
