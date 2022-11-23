import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_mixin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
        launchUrl(Uri.parse('https://pub.dev/packages/url_launcher'));
      },),
      body: Column(
        children: [
          Text('a',style: Theme.of(context).textTheme.subtitle1),
          LoadingBar(),
        ],
      ),
    );
  }
}
mixin LaunchMixin on State<PackageLearnView>{
  Future<void> launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchURL(url);
  }
}
}

