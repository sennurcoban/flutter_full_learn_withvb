import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes iconSizes = IconSizes();
  final IconColors iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {}, 
            icon:const Icon(Icons.message_outlined), 
            color: Theme.of(context).backgroundColor, 
            iconSize: IconSizes.iconSmall2x,),

            const SizedBox(height: 10,),

            IconButton(
            onPressed: () {}, 
            icon:const Icon(Icons.message_outlined), 
            color: iconColors.froly, 
            iconSize: iconSizes.iconSmall,),
            IconButton(
            onPressed: () {}, 
            icon:const Icon(Icons.message_outlined), 
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
  final Color froly = const Color(0xffED617A);
}