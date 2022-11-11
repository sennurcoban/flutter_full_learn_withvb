import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargins,
            // color :Colors.white,
            child: SizedBox(height: 100, width: 500, child: Center(child: Text('Ali')),),
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          ),
          Card(
              color: Theme.of(context).colorScheme.error,
              child: SizedBox(height: 100, width: 100,),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          ),
          _CustomCard(child: SizedBox(height: 100, width: 500, child: Center(child: Text('Ali')),),)

        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargins = EdgeInsets.all(10);
  static final roundedRectangleBorder = RoundedRectangleBorder(borderRadius:BorderRadius.circular(20));

}

// Border
// StadiumBorder(), CircleBorder(), RoundedRectangleBorder()

class _CustomCard extends StatelessWidget{
  

   _CustomCard({super.key, required this.child});
   final Widget child;
   final roundedRectangleBorder = RoundedRectangleBorder(borderRadius:BorderRadius.circular(20));


  @override
  Widget build(BuildContext context) {
    return Card(
            margin: ProjectMargins.cardMargins,
            // color :Colors.white,
            child: child,
            );
  }

}