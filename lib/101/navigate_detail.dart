import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({super.key, required this.isOkay});
  final bool isOkay;
  @override
  State<NavigateDetailLearn> createState() => _NavigateLearnState();
}

class _NavigateLearnState extends State<NavigateDetailLearn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ModalRoute.of(context).settings.arguments
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(onPressed: (){
          Navigator.of(context).pop(!widget.isOkay);
        }, 
        icon: Icon(Icons.check, color: widget.isOkay ? Colors.red : Colors.green,), 
        label: widget.isOkay ? Text('Red') : Text('Onayla'),),
      ),
    );
  }
}