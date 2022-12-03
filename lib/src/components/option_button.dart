import '../../packages.dart';

class OptionButton extends StatelessWidget {
  final String option;
  final Color color;
  final IconData iconData;
  final void Function()? onTap;
  const OptionButton({
    Key? key,
    required this.option,
    required this.color,
    this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(12.5),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          option,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        )
      ],
    );
  }
}
