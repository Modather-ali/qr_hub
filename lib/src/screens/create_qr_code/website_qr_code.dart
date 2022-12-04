import 'dart:developer';

import 'package:qr_hub/packages.dart';

class WebsiteQRCode extends StatelessWidget {
  WebsiteQRCode({Key? key}) : super(key: key);

  final TextEditingController _textEditingController =
      TextEditingController(text: 'https://');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SqlDatabase _sqlDatabase = SqlDatabase();
  final DateUtil _dateUtil = DateUtil();
  _saveQRCode() async {
    String url = _textEditingController.text;
    String urlType = 'website';
    if (!url.startsWith('http')) {
      url = 'https://$url';
      log(url);
    }

    if (_formKey.currentState!.validate()) {
      await _sqlDatabase.insertData(
          "INSERT INTO 'QrCodes' ('url', 'date', 'urlType') VALUES('$url', '${_dateUtil.currantDate}', '$urlType')");
      Get.off(() => const ViewQrCodeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _saveQRCode,
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
