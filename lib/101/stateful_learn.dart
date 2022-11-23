import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_button.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({super.key});

  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}//sadece data alan kısım,dışarıyla haberleşilen kısım(data al ver),değişmez

class _StatefulLearnState extends State<StatefulLearn> {
  int _countValue = 0;
  // int _counterCustom = 0;

  void _updateCounter(bool isIncrement){
    if(isIncrement){
      _countValue ++;
    }
    else{
      _countValue --;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text(LanguageItems.welcomeTitle)),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text(_countValue.toString(),style: Theme.of(context).textTheme.headline2,)),
          const Placeholder(),
          const CounterButton()
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(onPressed: (){_updateCounter(true);}, child:const Icon(Icons.add),);
  }

  Padding _deincrementButton() {
    return Padding(
          padding: const EdgeInsets.only(left:10,),
          child: FloatingActionButton(onPressed: (){_updateCounter(false);}, child:const Icon(Icons.remove),),
        );
  }
}//hayatı belirleyen kısım,logicleri yazacagımız kısım