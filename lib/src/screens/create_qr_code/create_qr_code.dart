import 'dart:developer';

import 'package:qr_hub/packages.dart';

class CreateQRCodePage extends StatefulWidget {
  final String urlType;
  final QRModel? qrModel;
  final int? index;
  const CreateQRCodePage(
      {Key? key, this.urlType = 'Website', this.qrModel, this.index})
      : super(key: key);

  @override
  State<CreateQRCodePage> createState() => _CreateQRCodePageState();
}

class _CreateQRCodePageState extends State<CreateQRCodePage> {
  final TextEditingController _textEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final QRController _controller = Get.put(QRController());

  final FocusNode _focusNode = FocusNode();

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

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
  };

  _storeQR() {
    if (widget.qrModel != null) {
      _updateQR();
    } else {
      _insertNewQR();
    }
  }

  _updateQR() async {
    String url = checkUrl(_textEditingController.text);

    if (_formKey.currentState!.validate()) {
      await _controller.updateQRDate(
        url: url,
        urlType: widget.qrModel!.urlType,
        id: widget.qrModel!.id,
        index: widget.index!,
      );
      Get.off(() => ViewQrCodeScreen(
            qrModel: _controller.qrModelsDataList[widget.index!],
            index: widget.index!,
          ));
    }
  }

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
        if (!url.startsWith('tel')) {
          url = 'tel:$url';
        }
        break;
      case 'Email':
        if (!url.startsWith('mailto')) {
          url = 'mailto:$url';
        }
        break;
      default:
        if (!url.startsWith('http')) {
          url = 'https:$url';
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
  void initState() {
    if (widget.qrModel != null) {
      _textEditingController.text = widget.qrModel!.url;
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _storeQR,
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
                    return "This Field is required".tr;
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
