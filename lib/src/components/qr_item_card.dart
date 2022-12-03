import 'package:qr_hub/packages.dart';

class QrItemCard extends StatefulWidget {
  const QrItemCard({Key? key}) : super(key: key);

  @override
  _QrItemCardState createState() => _QrItemCardState();
}

class _QrItemCardState extends State<QrItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ViewQrCodeScreen()));
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/qr_code.jpg',
                height: 50,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'https://',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'data',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
