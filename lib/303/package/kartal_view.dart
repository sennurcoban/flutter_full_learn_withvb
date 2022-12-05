import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lottie_learn.dart';
import 'package:kartal/kartal.dart';

typedef ImageLoader = void Function(String url);

class KartalView extends StatefulWidget {
  const KartalView({super.key, this.onImage});
  final ImageLoader? onImage;
  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        InkWell(
            onTap: () {
              context.navigateToPage(LottieLearn(), type: SlideType.BOTTOM);
            },
            child: Text('Kartal', style: context.textTheme.headline1)),
        Icon(context.isIOSDevice ? Icons.ios_share_outlined : Icons.android_outlined),
        AnimatedContainer(
          duration: context.durationLow,
          height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.15),
          color: Colors.red,
        ),
        TextField(),
        InkWell(
            onTap: () {
              'https://github.com/VB10/kartal'.launchWebsite;
            },
            child: Text('website')),
      ]),
    );
  }
}
