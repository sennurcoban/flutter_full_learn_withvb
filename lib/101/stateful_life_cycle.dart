import 'package:flutter/material.dart';

class StatefullLifeCycle extends StatefulWidget {
  const StatefullLifeCycle({super.key, required this.message});
  final String message; //müşteriden bir kere istediğimiz her şeyi buraya yazarız ve final olmalı

  @override
  State<StatefullLifeCycle> createState() => _StatefullLifeCycleState();
}

class _StatefullLifeCycleState extends State<StatefullLifeCycle> {
  String _mesagge ='';
  late final bool _isOdd;
  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   print('a');
  // }

  // void didUpdateWidget(covariant StatefullLifeCycle oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   print('b');
  // }

  // void dispose() {
  //   super.dispose();
  //   _mesagge=""; //sayfadan çıktığı an sayfanın öldüğü an.
  // }

  //Mesaj tekse yanına tek yaz değilse çift yaz.
  @override
  void initState() {
    super.initState();
    _mesagge = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    // print('c');
  }

  void _computeName() {
    if(_isOdd){
      _mesagge += " Tek";
    }
    else{
      _mesagge +=" Çift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_mesagge),
      ),
      body: _isOdd 
        ? TextButton(onPressed: () {}, child: Text(_mesagge))
        : ElevatedButton(onPressed: (){
          setState(() {
            _mesagge ='aaa';
          });
        }, child: Text(_mesagge)),

    );
  }
}