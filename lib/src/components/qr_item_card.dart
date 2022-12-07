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
        child: ListTile(
          leading: Hero(
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
          title: Text(
            qrModel.url,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            qrModel.date,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
