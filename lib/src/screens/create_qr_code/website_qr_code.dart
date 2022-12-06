import 'dart:developer';

import 'package:qr_hub/packages.dart';

class WebsiteQRCode extends StatelessWidget {
  WebsiteQRCode({Key? key}) : super(key: key);

  final TextEditingController _textEditingController =
      TextEditingController(text: 'https://');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SqlDatabase _sqlDatabase = SqlDatabase();
  final DateUtil _dateUtil = DateUtil();

  final QRController _controller = Get.put(QRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              String url = _textEditingController.text;
              String urlType = 'website';
              if (!url.startsWith('http')) {
                url = 'https://$url';
                log(url);
              }
              if (_formKey.currentState!.validate()) {
                await _controller.insertQRDate(url: url, urlType: urlType);
                Get.off(() => ViewQrCodeScreen(
                      qrModel: _controller.qrModelsDataList.last,
                      index: _controller.qrModelsDataList
                          .lastIndexOf(_controller.qrModelsDataList.last),
                    ));
              }
            },
            icon: const Icon(
              Icons.done,
              color: Colors.green,
            ),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          children: [
            Form(
              key: _formKey,
              child: SuperTextField(
                fieldName: "url",
                textInputType: TextInputType.url,
                controller: _textEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field is required";
                  }

                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
