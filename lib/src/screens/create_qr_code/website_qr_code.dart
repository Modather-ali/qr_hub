import 'dart:developer';

import 'package:qr_hub/packages.dart';

class WebsiteQRCode extends StatefulWidget {
  final String urlType;
  final QRModel? qrModel;
  const WebsiteQRCode({Key? key, this.urlType = 'Website', this.qrModel})
      : super(key: key);

  @override
  State<WebsiteQRCode> createState() => _WebsiteQRCodeState();
}

class _WebsiteQRCodeState extends State<WebsiteQRCode> {
  final TextEditingController _textEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final QRController _controller = Get.put(QRController());

  final FocusNode _focusNode = FocusNode();

  final Map<String, Map> _textFieldType = {
    'Website': {
      'field_label': 'https://example.com',
      'text_input_type': TextInputType.url,
    },
    'Mobile Number': {
      'field_label': '+249000000000',
      'text_input_type': TextInputType.phone,
    },
    'Email': {
      'field_label': 'example@example.com',
      'text_input_type': TextInputType.emailAddress,
    },
    // '':{
    //   'field_label':'',
    //   'text_input_type' : ''
    // },
  };

  _insertNewQR() async {
    _focusNode.unfocus();
    String url = checkUrl(_textEditingController.text);

    if (_formKey.currentState!.validate()) {
      await _controller.insertQRDate(url: url, urlType: widget.urlType);
      Get.off(() => ViewQrCodeScreen(
            qrModel: _controller.qrModelsDataList.last,
            index: _controller.qrModelsDataList
                .lastIndexOf(_controller.qrModelsDataList.last),
          ));
    }
  }

  String checkUrl(String link) {
    String url = _textEditingController.text;
    switch (widget.urlType) {
      case 'Mobile Number':
        url = 'tel:$url';
        break;
      case 'Email':
        url = 'mailto:$url';
        break;
      default:
        if (!url.startsWith('http')) {
          url = 'https://$url';
        }
    }
    log(url);
    return url;
  }

  @override
  void deactivate() {
    _textEditingController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _insertNewQR,
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
                focusNode: _focusNode,
                fieldName: _textFieldType[widget.urlType]!['field_label'],
                textInputType:
                    _textFieldType[widget.urlType]!['text_input_type'],
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
