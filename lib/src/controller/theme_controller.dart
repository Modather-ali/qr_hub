import 'dart:developer';

import '../../packages.dart';

class ThemeController extends GetxController {
  final SqlDatabase _sqlDatabase = SqlDatabase();
  String themeMode = 'dark';
  String local = 'en';

  Future readData() async {
    List<Map<String, Object?>> data;
    QRModel qrModel;
    data = await _sqlDatabase.readData('SELECT * FROM AppData');
    if (data.isNotEmpty) {
      for (var element in data) {
        themeMode = element['theme_mode'].toString();
        local = element['local'].toString();
      }
    } else {
      await _sqlDatabase.insertData(
          "INSERT INTO 'AppData' ('theme_mode', 'local') VALUES('$themeMode', '$local')");
    }
    log('theme $themeMode');
    log('local $local');
    update();
  }

  Future updateDate({
    required String newMode,
    required String newLocale,
  }) async {
    await _sqlDatabase.updateData('''
        UPDATE AppData SET 
        theme_mode = "$newMode", 
        local = "$newLocale"
        ''');
    themeMode = newMode;
    local = newLocale;
    log('new theme $themeMode');
    log('new local $local');
    update();
  }
}
