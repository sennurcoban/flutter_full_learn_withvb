import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({super.key, this.id});
  final String? id;

  @override
  State<NavigateHomeDetailView> createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
  String? _id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget.id;
    if (_id == null) {
      Future.microtask(
        () {
          final _modelId = ModalRoute.of(context)?.settings.arguments;
          // if (_modelId is String) {
          //   _id = _modelId;
          // } else{
          //   _id = widget.id;
          // }
          setState(() {
            _id = _modelId is String ? _modelId : widget.id;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).errorColor,
      appBar: AppBar(
        title: Text(_id ?? ''),
      ),
    );
  }
}
