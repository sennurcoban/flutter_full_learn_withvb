import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  CustomWidgetLearn({super.key});
  final String title = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,//Sayfanın widthini aldık.
              child: CustomFoodButton(title:title,onPressed: () {})),
          )),
          SizedBox(height: 100,),
          CustomFoodButton(title:title, onPressed: () {},),
        ],
      ),
    );
  }
}

// bu classı sadece burda kullandığımda başına _ eklerim
class _ColorsUtility {
  final Color buttonTextColor = Colors.white;
  final Color buttonBackGroundColor =Colors.red;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets bigPadding = const EdgeInsets.all(16.0);
}

class CustomFoodButton extends StatelessWidget with _ColorsUtility,_PaddingUtility {
  CustomFoodButton({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor :buttonBackGroundColor, shape: StadiumBorder()),
        onPressed: onPressed, child: Padding(
          padding: bigPadding,
          child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: buttonTextColor, fontWeight: FontWeight.bold),
      ),
        ));
  }
}