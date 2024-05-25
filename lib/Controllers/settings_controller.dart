import 'package:apna_news/Models/category_model.dart';
import 'package:apna_news/Utils/appconstants.dart';
import 'package:apna_news/Utils/local_shared_preferences.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxString selectedLanguage = "".obs;
  @override
  void onInit() {
    getInit();
    super.onInit();
  }

  getInit() async {
    String lang = await LocalPreferences().getLanguage() ?? "en";
    LanguageModel language = AppConstants()
        .languageList
        .firstWhere((element) => element.code == lang);

    selectedLanguage.value = language.launguage;
  }

  void changeSelectedValue(String language) {
    selectedLanguage(language);
    LanguageModel langua = AppConstants()
        .languageList
        .firstWhere((element) => element.launguage == language);
    LocalPreferences().setLanguage(langua.code);
  }
}
