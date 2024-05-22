import 'package:apna_news/Utils/route_names.dart';
import 'package:apna_news/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'appcolors.dart';

class CommonFunctions {
  static var globalContext = NavigationService.navigatorKey.currentContext!;
  String selectedVisitDate = "", selectedVisitTime = "";

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  String returnAppDateFormat(DateTime date) =>
      DateFormat('dd-MM-yyyy').format(date);

  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  Future pickDate(BuildContext context, DateTime? pickedDate) async {
    final initalDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? initalDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (newDate == null) {
      return ["null", null];
    } else {
      selectedVisitDate = DateFormat('dd-MM-yyyy').format(newDate);
      return [selectedVisitDate, newDate];
    }
  }

  Future pickTime(BuildContext context, TimeOfDay? pickedTime) async {
    final initalTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: pickedTime ?? initalTime,
    );
    if (newTime == null) {
      return ["null", null];
    } else {
      selectedVisitTime = formatTimeOfDay(newTime);
      return [selectedVisitTime, newTime];
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format =
        DateFormat.jm(); // Use 'jm' for hh:mm a format, 'Hm' for 24-hour format
    return format.format(dt);
  }

  static void showErrorSnackbar(String msg) {
    ScaffoldMessenger.of(globalContext).clearSnackBars();
    ScaffoldMessenger.of(globalContext).showSnackBar(SnackBar(
        margin: const EdgeInsets.only(bottom: 70.0, left: 20, right: 20),
        content: Text(
          msg,
          style: GoogleFonts.poppins(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        backgroundColor: Colors.red.withOpacity(.8),
        behavior: SnackBarBehavior.floating));
  }

  static void showSuccessSnackbar(String msg) {
    ScaffoldMessenger.of(globalContext).clearSnackBars();
    ScaffoldMessenger.of(globalContext).showSnackBar(SnackBar(
        margin: const EdgeInsets.only(bottom: 70.0, left: 20, right: 20),
        content: Text(
          msg,
          style: GoogleFonts.poppins(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        backgroundColor: Colors.green.withOpacity(.8),
        behavior: SnackBarBehavior.floating));
  }

  static void showWarningSnackbar(String msg) {
    ScaffoldMessenger.of(globalContext).clearSnackBars();
    ScaffoldMessenger.of(globalContext).showSnackBar(SnackBar(
        margin: const EdgeInsets.only(bottom: 70.0, left: 20, right: 20),
        content: Text(
          msg,
          style: GoogleFonts.poppins(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        backgroundColor: blackColor,
        behavior: SnackBarBehavior.floating));
  }

  // Future<void> makePhoneCall(String phone) async {
  //   String phoneNumber =
  //       'tel:+91$phone'; // Replace with the desired phone number

  //   // Check if the phone call can be launched
  //   if (await canLaunchUrl(Uri.parse(phoneNumber))) {
  //     // Launch the phone call
  //     await launchUrl(Uri.parse(phoneNumber));
  //   } else {
  //     CommonFunctions.showErrorSnackbar("Something went wrong.");
  //   }
  // }

  double? calculateTotal(double? rate, int? quantity) {
    if (rate == null || quantity == null) {
      debugPrint('Rate or quantity cannot be null.');
      return null;
    }

    if (rate <= 0 || quantity <= 0) {
      debugPrint('Rate and quantity should be greater than zero.');
      return null;
    }

    double total = rate * quantity;
    return total;
  }

  String returnCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  }

  String returnAPiDateFormat(String date) {
    if (date.isEmpty) {
      return "";
    }
    var helper = date.split("-");

    return "${helper[2]}-${helper[1]}-${helper[0]}";
  }

  // Future<UserProfileModel> getProfileData() async {
  //   String helper = await LocalPreferences().getProfileData() ?? "";

  //   Map<String, dynamic> userMap = jsonDecode(helper);
  //   UserProfileModel userProfile = UserProfileModel.fromJson(userMap);
  //   return userProfile;
  // }

  void sessionTimeOut() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    Get.offAllNamed(RouteNames.splashScreen);
  }

  void logOut() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.offAllNamed(RouteNames.splashScreen);
  }
}
