import '../../packages.dart';

class ThemeController extends GetxService {
  late SharedPreferences _sharedPreferences;
  bool isDark = false;
  String local = 'en';

  Future<ThemeController> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    isDark = _sharedPreferences.getBool('theme_mode') ?? false;
    local = _sharedPreferences.getString('local') ?? 'en';
    return this;
  }

  Future changeThemeMode(bool isDarkMode) async {
    if (isDarkMode) {
      Get.changeTheme(darkTheme);
    } else {
      Get.changeTheme(lightTheme);
    }
    isDark = isDarkMode;
    await _sharedPreferences.setBool('theme_mode', isDarkMode);
  }

  Future changeLang(String langCode) async {
    Locale newLocale = Locale(langCode);
    local = langCode;
    await Get.updateLocale(newLocale);
    await _sharedPreferences.setString('local', langCode);
  }
}
