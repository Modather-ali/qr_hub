import 'package:qr_hub/packages.dart';

class QrItemCard extends StatelessWidget {
  final QRModel qrModel;
  final int index;
  const QrItemCard({Key? key, required this.qrModel, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewQrCodeScreen(
                      qrModel: qrModel,
                      index: index,
                    )));
      },
      child: Card(
        child: Row(
          children: [
            Hero(
              tag: qrModel.id,
              child: SizedBox(
                height: 50,
                width: 50,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SfBarcodeGenerator(
                    value: qrModel.url,
                    symbology: QRCode(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // qrModel.url.length > 20 ? '' :
                      qrModel.url,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
