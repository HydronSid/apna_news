import 'package:apna_news/Screens/HomeScreen/home_screen.dart';
import 'package:apna_news/Screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteNames {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String loginScreen = "/login_screen";
}

class AppRoute {
  static appRoutes() => [
        GetPage(
            name: RouteNames.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteNames.homeScreen,
            page: () => const HomeScreen(),
            transition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        // GetPage(
        //     name: RouteNames.loginScreen,
        //     page: () => const LoginScreen(),
        //     transition: Transition.rightToLeftWithFade,
        //     transitionDuration: const Duration(milliseconds: 250)),
      ];
}
