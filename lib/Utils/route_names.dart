import 'package:apna_news/Screens/HomeScreen/home_screen.dart';
import 'package:apna_news/Screens/ViewAllHeadLines/view_all_headlines.dart';
import 'package:apna_news/Screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteNames {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String viewAllHeadLines = "/view_all_headlines";
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
        GetPage(
            name: RouteNames.viewAllHeadLines,
            page: () => const ViewAllHeadLines(),
            transition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
