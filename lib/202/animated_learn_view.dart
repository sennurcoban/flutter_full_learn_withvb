import 'package:flutter/material.dart';

const double kZero = 0;
class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow, opacity: _isOpacity ? 1 : 0, child: const Text('data')),
            trailing: IconButton(
                onPressed: () {
                  _changeOpacity();
                },
                icon: Icon(Icons.precision_manufacturing_rounded)),
          ),
          AnimatedDefaultTextStyle(
              child: Text('data'),
              style: (_isVisible ? context.textTheme().headline1 : context.textTheme().subtitle1) ?? TextStyle(),
              duration: _DurationItems.durationLow),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
          ),
          AnimatedContainer(duration: _DurationItems.durationLow,
          height: _isVisible ? kZero : MediaQuery.of(context).size.width* 0.2, //ekranın %20sini kaplasın
          width: MediaQuery.of(context).size.height * 0.2,
          color: Colors.purple,
          margin: EdgeInsets.all(20),
          ),
          Expanded(child: Stack(
            children: [
              AnimatedPositioned(
                top: 15,
                curve: Curves.elasticOut,
                child: Text('bbb'), duration:_DurationItems.durationLow )
            ],
          )),
          Expanded(
            child: AnimatedList(itemBuilder: (context, index, animation) {
              return Text('veri');
            },),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: Placeholder(),
      secondChild: SizedBox.shrink(),
      duration: _DurationItems.durationLow,
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

//contextlerine erişim sağladık
extension BuildContentExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
