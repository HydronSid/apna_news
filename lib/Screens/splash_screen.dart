import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/images.dart';
import 'package:apna_news/Utils/local_shared_preferences.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      bool isLogin = await LocalPreferences().getLoginBool() ?? false;

      if (isLogin) {
        Get.toNamed(RouteNames.homeScreen);
      } else {
        Get.toNamed(RouteNames.homeScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Images.appLogo),
              Lottie.asset(Images.appLoader, height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
