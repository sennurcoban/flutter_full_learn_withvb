import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.message_outlined), 
            color: Theme.of(context).backgroundColor, 
            iconSize: IconSizes.iconSmall2x,),

            SizedBox(height: 10,),

            IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.message_outlined), 
            color: iconColors.froly, 
            iconSize: iconSizes.iconSmall,),
            IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.message_outlined), 
            color: iconColors.froly, 
            iconSize: iconSizes.iconSmall,)
            
            ],
            
      ),
    );
  }
}

class IconSizes {
  final double iconSmall=40;
  static const double iconSmall2x = 80;
}

class IconColors {
  final Color froly = Color(0xffED617A);
}