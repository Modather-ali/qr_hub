import 'dart:developer';

import '../../packages.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final QRController _controller = Get.put(QRController());
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    setState(() {});
    await controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) async {
      result = scanData;

      log(result!.code!);
      if (result != null) {
        await controller.stopCamera();
        await _insertNewQR(result!.code!);
      }
    });
  }

  Future _insertNewQR(String url) async {
    await _controller.insertQRDate(url: url, urlType: 'Website');
    Get.off(() => ViewQrCodeScreen(
          qrModel: _controller.qrModelsDataList.last,
          index: _controller.qrModelsDataList.length - 1,
          // .lastIndexOf(_controller.qrModelsDataList.last),
        ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(borderRadius: 20),
            ),
          ),
        ],
      ),
    );
  }
}
