import 'package:flutter/cupertino.dart';

import '../../product/navigator/navigator_routes.dart';

class NavigatorManagement {
  // GlobalKey<NavigatorState> navigatorleri ymnetmemizi sağlar
  //her kullanan buna erişmesin
  //herkes kullanamasın her defasında üretilmesin: singleton
  NavigatorManagement._();
  static NavigatorManagement instance = NavigatorManagement._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(route.withParaghf, arguments: arguments);
  }
}
