import 'package:qr_hub/packages.dart';

class ViewQrCodeScreen extends StatelessWidget {
  final QRModel qrModel;
  const ViewQrCodeScreen({Key? key, required this.qrModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3),
                        ),
                      ),
                      Container(
                        height: 260,
                        width: 200,
                        color: Colors.white,
                      ),
                      Container(
                        height: 200,
                        width: 260,
                        color: Colors.white,
                      ),
                      Hero(
                        tag: qrModel.id,
                        child: SizedBox(
                          height: 220,
                          width: 220,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SfBarcodeGenerator(
                              value: qrModel.url,
                              symbology: QRCode(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 100,
                    width: 250,
                    child: TextButton(
                      onPressed: () {},
                      child: AutoSizeText(
                        qrModel.url,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  OptionButton(
                    option: 'Edit',
                    color: Colors.blue,
                    iconData: Icons.edit,
                  ),
                  OptionButton(
                    option: 'Delete',
                    color: Colors.red,
                    iconData: Icons.delete,
                  ),
                  OptionButton(
                    option: 'Open',
                    color: Colors.lime,
                    iconData: Icons.open_in_new,
                  ),
                  OptionButton(
                    option: 'Share',
                    color: Colors.green,
                    iconData: Icons.share,
                  ),
                  OptionButton(
                    option: 'Save',
                    color: Colors.cyan,
                    iconData: Icons.download,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _shareUrl() {
    Share.share(qrModel.url);
  }
}
