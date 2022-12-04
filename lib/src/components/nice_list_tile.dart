import 'package:qr_hub/packages.dart';

class NiceListTile extends StatelessWidget {
  final String titleText;
  final IconData iconData;
  final void Function()? onTap;
  const NiceListTile({
    Key? key,
    required this.titleText,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        titleText,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      leading: CircleAvatar(child: Icon(iconData)),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
    );
  }
}
