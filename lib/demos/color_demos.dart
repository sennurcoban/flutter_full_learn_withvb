import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key, required this.initialColor});
  final Color? initialColor; // alt komponent Colorı kontrol etti 
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.initialColor != _backgroundColor && widget.initialColor != null){
      changeBackgroundColor(widget.initialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTop, items: const [
        BottomNavigationBarItem(
            icon: _colorContainer(
              color: Colors.white,
            ),
            label: 'White'),
        BottomNavigationBarItem(
            icon: _colorContainer(
              color: Colors.green,
            ),
            label: 'Green'),
        BottomNavigationBarItem(
            icon: _colorContainer(
              color: Colors.red,
            ),
            label: 'Red'),
      ]),
    );
  }

  void _colorOnTop(int value) {
    if (value == _MyColors.white.index) {
      changeBackgroundColor(Colors.white);
    } else if (value == _MyColors.green.index) {
      changeBackgroundColor(Colors.green);
    } else if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    }
  }
}

enum _MyColors { white, green, red }

class _colorContainer extends StatelessWidget {
  const _colorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
