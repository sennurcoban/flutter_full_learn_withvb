import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/navigate_detail.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_full_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_full_learn/main.dart';
import 'package:flutter_full_learn/product/navigator/navigator_routes.dart';

import '../../303/lottie_learn.dart';
import '../../303/mobx_image_picker/view/mobx_image_upload_view.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      _navigateToNormal(LottieLearn());
    }
    // if (routeSettings.name == NavigatorRoutes.paraghf) return _navigateToNormal(LottieLearn());

    final _routes = routeSettings.name == NavigatorRoutes.paraghf
        ? NavigateRoutes.initialize
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));
    // replaceFirst("/", "")
    switch (_routes) {
      case NavigateRoutes.initialize:
        return _navigateToNormal(LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(NavigateHomeView());
      case NavigateRoutes.detail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetailView(
              id: _id is String ? _id : null,
            ),
            isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) {
        return child;
      },
    );
  }
}
