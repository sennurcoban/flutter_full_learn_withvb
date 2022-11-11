import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.9);//diğer sayfayı kenarından gösterir.

  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          FloatingActionButton(
            onPressed: (){
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: _CurveUtility._curveFast);
            },
            child:const Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: (){
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: _CurveUtility._curveSlow);
            },
            child:const Icon(Icons.chevron_right),
          ),
          
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          IconLearnView(),
          const StackLearn(),
          Container(color: Colors.pinkAccent,),
          Container(color: Colors.purple,)
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds:1);
}

class _CurveUtility {
  static const _curveSlow = Curves.slowMiddle;
  static const _curveFast = Curves.fastOutSlowIn;
}