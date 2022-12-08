import '../../packages.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: ListView(
        children: const [
          NiceListTile(
            titleText: 'Share the app',
            iconData: Icons.share,
          ),
          NiceListTile(
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
