import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            context: context,
            // barrierDismissible: false, //arka tarafın tıklanılabilir özelliğini kapatmak için
            builder: (context) {
              return _ImageZoomDialog();
            },
          );
        },
      ),
      appBar: AppBar(),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Version update'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('update2')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close2'))
      ],
    );
  }
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: Text('Version update'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('update2')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close2'))
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: InteractiveViewer(
        //zoom yapmak için
        child: Image.network(
          'https://picsum.photos/200',
          fit: BoxFit.cover,
          height: 400,
        ),
      ),
    );
  }
}
