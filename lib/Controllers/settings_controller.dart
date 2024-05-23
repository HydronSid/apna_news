import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxInt selectedValue = 0.obs;

  @override
  void onInit() {
    getInit();
    super.onInit();
  }

  getInit() async {
    //selectedValue.value = await LocalPreferences().getLanguage() ?? "en";
  }

  void changeSelectedValue(int value) {
    // selectedValue.value = AppConstants()
    //     .languageList
    //     .firstWhere((element) => element.code == selectedLan);
    selectedValue.value = value;
  }
}
