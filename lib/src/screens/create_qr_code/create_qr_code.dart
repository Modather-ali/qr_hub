import 'package:qr_hub/packages.dart';

class CreateQrCodePage extends StatefulWidget {
  const CreateQrCodePage({Key? key}) : super(key: key);

  @override
  _CreateQrCodePageState createState() => _CreateQrCodePageState();
}

class _CreateQrCodePageState extends State<CreateQrCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Qr Code',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          NiceListTile(
            titleText: 'Website',
            iconData: Icons.link,
            onTap: () {
              Get.to(() => WebsiteQRCode());
            },
          ),
        ],
      ),
    );
  }
}
