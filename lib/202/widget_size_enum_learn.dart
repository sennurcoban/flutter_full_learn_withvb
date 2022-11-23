import 'package:flutter/material.dart';

class WidgetSizeLearnEnum extends StatefulWidget {
  const WidgetSizeLearnEnum({super.key});

  @override
  State<WidgetSizeLearnEnum> createState() => _WidgetSizeLearnEnumState();
}

class _WidgetSizeLearnEnumState extends State<WidgetSizeLearnEnum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSizes.normalCardHeight.value(),
          color: Colors.green,
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidth:
        return 25;
    }
  }
}
