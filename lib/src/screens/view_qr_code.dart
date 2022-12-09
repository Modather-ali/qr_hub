import 'dart:developer';
import 'dart:io';

import 'package:qr_hub/packages.dart';

class ViewQrCodeScreen extends StatelessWidget {
  final QRModel qrModel;
  final int index;
  ViewQrCodeScreen({
    Key? key,
    required this.qrModel,
    required this.index,
  }) : super(key: key);
  final QRController _controller = Get.put(QRController());
  final ScreenshotController _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                alignment: Alignment.center,
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
                    const SizedBox(
                      height: 30,
                    ),
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
                          child: Screenshot(
                            controller: _screenshotController,
                            child: Container(
                              color: Colors.white,
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 100,
                        width: 250,
                        child: InkWell(
                          onTap: _openUrl,
                          child: AutoSizeText(
                            qrModel.urlType != 'Website'
                                ? qrModel.url.split(':')[1]
                                : qrModel.url,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            locale: const Locale('en'),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.deepPurple,
                            ),
                          ),
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
                  children: [
                    OptionButton(
                      onTap: () {
                        Get.off(() => CreateQRCodePage(
                              index: index,
                              qrModel: qrModel,
                              urlType: qrModel.urlType,
                            ));
                      },
                      option: 'Edit'.tr,
                      color: Colors.blue,
                      iconData: Icons.edit,
                    ),
                    OptionButton(
                      onTap: () async {
                        await _controller.deleteData(qrModel.id, index);

                        Get.back();
                        Get.snackbar("You have deleted".tr, qrModel.url,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15));
                      },
                      option: 'Delete'.tr,
                      color: Colors.red,
                      iconData: Icons.delete,
                    ),
                    OptionButton(
                      onTap: _openUrl,
                      option: 'Open'.tr,
                      color: Colors.lime,
                      iconData: Icons.open_in_new,
                    ),
                    OptionButton(
                      onTap: _shareUrl,
                      option: 'Share'.tr,
                      color: Colors.green,
                      iconData: Icons.share,
                    ),
                    OptionButton(
                      onTap: _saveQRCodeAsImage,
                      option: 'Save'.tr,
                      color: Colors.cyan,
                      iconData: Icons.download,
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

  _shareUrl() async {
    try {
      await _screenshotController
          .capture(delay: const Duration(milliseconds: 1000))
          .then((image) async {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image!);

        await Share.shareFiles([imagePath.path], text: qrModel.url);
      });
    } catch (e) {
      log("error in share $e");
    }
  }

  _openUrl() async {
    try {
      Uri url = Uri.parse(qrModel.url);
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      log("error in open $e");
    }
  }

  _saveQRCodeAsImage() async {
    try {
      PermissionStatus permissionStatus = await Permission.storage.request();
      if (permissionStatus.isGranted) {
        // String newPath = "storage/emulated/0/QrHub";
        String fileName =
            '${qrModel.urlType}_${qrModel.url.split('/').last}.png';

        _screenshotController.capture().then((image) async {
          await ImageGallerySaver.saveImage(image!,
              name: fileName, quality: 100);
        });
        log("save success $fileName");
      }
    } catch (e) {
      log("error in save $e");
    }
  }
}
