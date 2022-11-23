import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;
  LightTheme(){
    theme = ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:Colors.yellow),
      
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          onPrimary: Colors.purple,
          onSecondary: _lightColor.fushia,
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 25,color: _lightColor._textColor)
      ),
    );
  }
}

class _LightColor {
  final Color _textColor = Colors.black54;
  final Color fushia = Color.fromARGB(238, 17, 204,1);//property
}