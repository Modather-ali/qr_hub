import '../../packages.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({Key? key}) : super(key: key);
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: ListView(
        children: [
          NiceListTile(
            onTap: () {
              bool isDark = _themeController.themeMode == 'dark';
              _themeController.updateDate(
                newLocale: _themeController.local,
                newMode: isDark ? 'light' : 'dark',
              );
            },
            titleText: 'Share the app',
            iconData: Icons.share,
          ),
          const NiceListTile(
            titleText: 'Rate us',
            iconData: Icons.star_rate,
          ),
          // NiceListTile(titleText: '', iconData: Icons),
          // NiceListTile(titleText: '', iconData: Icons),
          // NiceListTile(titleText: '', iconData: Icons),
        ],
      ),
    );
  }
}
