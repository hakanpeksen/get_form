import 'package:get/get.dart';

import '../login_form/view/home_view.dart';
import '../login_form/view/login_view.dart';
import '../login_form/view/splash_view.dart';

class AppRouter {
  static const String splash = '/splash', home = '/home', login = '/login';

  static List<GetPage<dynamic>>? routes = [
    GetPage(name: splash, page: () => const SplashView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: login, page: () => const LoginView()),
  ];
}
