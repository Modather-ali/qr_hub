import '../../packages.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({Key? key}) : super(key: key);
  final ThemeController _themeController = Get.put(ThemeController());
  final String _appStoreLink =
      'https://play.google.com/store/apps/details?id=com.example.qr_hub';
  final String _githubLink = 'https://github.com/Modather-ali/qr_hub';
  _lunchUrl(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: ListView(
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(appIcon),
              ),
            ),
          ),
          NiceListTile(
            onTap: () async {
              await Share.share(_appStoreLink);
            },
            titleText: 'Share the app'.tr,
            iconData: Icons.share,
            showTrailing: false,
          ),
          NiceListTile(
            onTap: () async {
              _lunchUrl(_appStoreLink);
            },
            titleText: 'Rate us'.tr,
            iconData: Icons.star_rate,
            showTrailing: false,
          ),
          NiceListTile(
            onTap: () async {
              _lunchUrl(_githubLink);
            },
            titleText: 'Source Code'.tr,
            iconData: Icons.code,
            showTrailing: false,
          ),
          NiceListTile(
            onTap: () async {
              String langCode = 'en';
              if (_themeController.local == 'en') {
                langCode = 'ar';
              }

              await _themeController.changeLang(langCode);
            },
            titleText: 'locale'.tr,
            iconData: Icons.translate,
            showTrailing: false,
          ),
          // NiceListTile(titleText: '', iconData: Icons, showTrailing: false,),

          Center(
            child: DayNightSwitcher(
              isDarkModeEnabled: _themeController.isDark,
              onStateChanged: (isDarkModeEnabled) async {
                await _themeController.changeThemeMode(isDarkModeEnabled);
              },
            ),
          ),
        ],
      ),
    );
  }
}
