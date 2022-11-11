import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'Home Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.chevron_left),
        // automaticallyImplyLeading: false, //back iconunu default etme
        // leadingWidth: 23,// back butonunu sola daha yakınlaştırır
        // toolbarTextStyle: TextStyle(color: Colors.amber),
        // actionsIconTheme: IconThemeData(color: Colors.lightGreen),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            
          ),
          Center(child: CircularProgressIndicator()),
          
        ],
      ),
    );
  }
}
