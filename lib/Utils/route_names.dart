import 'package:apna_news/Screens/ArticleDetail/article_detail.dart';
import 'package:apna_news/Screens/HomeScreen/home_screen.dart';
import 'package:apna_news/Screens/Settings/settings.dart';
import 'package:apna_news/Screens/ViewAllTopHeadLines/view_all_headlines.dart';
import 'package:apna_news/Screens/ViewMoreAllNews/view_all_news.dart';
import 'package:apna_news/Screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteNames {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String viewAllHeadLines = "/view_all_headlines";
  static const String viewAllNews = "/view_all_news";
  static const String articleDetail = "/article_detail";
  static const String settingsScreen = "/settings_screen";
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
        GetPage(
            name: RouteNames.viewAllNews,
            page: () => const ViewAllNews(),
            transition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteNames.articleDetail,
            page: () => const ArticleDetail(),
            transition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteNames.settingsScreen,
            page: () => const SettingsScreen(),
            transition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
