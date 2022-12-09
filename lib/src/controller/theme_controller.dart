import '../../packages.dart';

class ThemeController extends GetxService {
  late SharedPreferences _sharedPreferences;
  final SqlDatabase _sqlDatabase = SqlDatabase();
  bool isDark = false;
  String local = 'en';

  Future<ThemeController> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    isDark = _sharedPreferences.getBool('theme_mode') ?? false;
    local = _sharedPreferences.getString('local') ?? 'en';
    await setThemeMode(isDark);

    return this;
  }

  Future setThemeMode(bool isDarkMode) async {
    if (isDarkMode) {
      Get.changeTheme(darkTheme);
    } else {
      Get.changeTheme(lightTheme);
    }
    isDark = isDarkMode;
    await _sharedPreferences.setBool('theme_mode', isDarkMode);
  }
}
