import 'package:qr_hub/packages.dart';

class QrItemCard extends StatelessWidget {
  final QRModel qrModel;
  const QrItemCard({Key? key, required this.qrModel}) : super(key: key);
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
            // SfBarcodeGenerator(value: qrModel.url),
            SizedBox(
              height: 50,
              width: 50,
              child: SfBarcodeGenerator(
                value: qrModel.url,
                symbology: QRCode(),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: Image.asset(
            //     'assets/images/qr_code.jpg',
            //     height: 50,
            //   ),
            // ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  qrModel.url.length > 20 ? '' : qrModel.url,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  qrModel.date,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
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
