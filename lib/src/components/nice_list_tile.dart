import 'package:qr_hub/packages.dart';

class NiceListTile extends StatelessWidget {
  final String titleText;
  final IconData iconData;
  final bool showTrailing;
  final void Function()? onTap;
  const NiceListTile({
    Key? key,
    required this.titleText,
    required this.iconData,
    this.onTap,
    this.showTrailing = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            titleText,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(child: Icon(iconData)),
          trailing: showTrailing
              ? const Icon(
                  Icons.arrow_forward_ios_rounded,
                )
              : null,
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
