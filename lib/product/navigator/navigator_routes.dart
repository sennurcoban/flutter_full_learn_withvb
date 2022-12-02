import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paraghf = "/";
  final items = {
    paraghf: (context) => LottieLearn(),
    NavigateRoutes.home.withParaghf: (context) => NavigateHomeView(),
    NavigateRoutes.detail.withParaghf: (context) => NavigateHomeDetailView(),
  };
}

enum NavigateRoutes { initialize, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaghf => "/$name";
}
