import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loadinglottie = 'https://assets6.lottiefiles.com/packages/lf20_g32kbbp3.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadinglottie));
  }
}
