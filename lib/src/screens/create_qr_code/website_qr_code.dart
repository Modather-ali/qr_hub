import 'package:qr_hub/packages.dart';

class WebsiteQRCode extends StatelessWidget {
  WebsiteQRCode({Key? key}) : super(key: key);

  final TextEditingController _textEditingController =
      TextEditingController(text: 'https://');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          children: [
            SuperTextField(
              textInputType: TextInputType.url,
              controller: _textEditingController,
            ),
          ],
        ),
      ),
    );
  }
}
