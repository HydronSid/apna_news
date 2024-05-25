import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'Controllers/theme_controller.dart';
import 'Screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: whiteColor, statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          builder: (context, child) {
            child = EasyLoading.init()(context, child);
            child = MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child);
            return child;
          },
          title: 'Apna News ',
          navigatorKey: NavigationService.navigatorKey,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          getPages: AppRoute.appRoutes(),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
