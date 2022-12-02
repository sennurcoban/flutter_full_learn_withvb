import 'package:flutter/cupertino.dart';
import 'package:flutter_full_learn/303/navigator/navigator_manager.dart';

mixin NavigatorMixin<T extends StatefulWidget> on State<T> {
  NavigatorManagement get router => NavigatorManagement.instance;
}
