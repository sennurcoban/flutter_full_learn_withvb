import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package_learn_view.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin on State<PackageLearnView>{
  Future<void> launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchURL(url);
  }
}
}//constructorı olmayan klasslar-mixin