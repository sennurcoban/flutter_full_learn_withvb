import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // color:Theme.of(context).errorColor, 
        child: Text(
          'data', 
          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).errorColor),)),
    );
  }
}

class ColorsItems{
  static final Color porsche =Color(0xffEDBF61);
  static final Color sulu = Color.fromRGBO(198, 237, 97, 1);

  
}