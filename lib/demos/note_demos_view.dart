import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});
  final _title = 'Create your first note';
  final _description = 'Add a note about anything your thoughts on climate change or your history essay and share it with the world.';
  final _createNote = 'Create A Note';
  final _importNotes = 'Import Notes';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar( systemOverlayStyle: SystemUiOverlayStyle.dark,),
      body:Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWithoutPath),
            _TitleWidget(title: _title),
            Padding(padding: PaddingItems.verticalPadding, child: _SubTitleWidget(subtitle: _description,)),
            Spacer(),
            _CreateButton(context),
              TextButton(onPressed: () {}, child: Text(_importNotes)),
              SizedBox(height: ButtonHeights.buttonNormalHeight,)
          ],
        ),
      )
    );
  }

  ElevatedButton _CreateButton(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: SizedBox(
            height: ButtonHeights.buttonNormalHeight,
            child: Center(child: Text(_createNote,
            style: Theme.of(context).textTheme.headline5,
            ))));
  }
}

//Centered text widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget({
    Key? key,
    this.textAlign = TextAlign.left, required this.subtitle
  }) : super(key: key);
  final TextAlign textAlign;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black,
      fontWeight: FontWeight.w300
    )
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black,
    fontWeight: FontWeight.w500
    ),);
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);

}

class ButtonHeights{
  static const double buttonNormalHeight = 50;
}