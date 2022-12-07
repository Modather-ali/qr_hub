import 'package:qr_hub/packages.dart';

class CreateQrCodePage extends StatefulWidget {
  const CreateQrCodePage({Key? key}) : super(key: key);

  @override
  _CreateQrCodePageState createState() => _CreateQrCodePageState();
}

class _CreateQrCodePageState extends State<CreateQrCodePage> {
  final List<Map> _qrType = [
    {
      'type': 'Website',
      'icon': Icons.link,
    },
    {
      'type': 'Mobile Number',
      'icon': Icons.phone,
    },
    {
      'type': 'Email',
      'icon': Icons.email,
    },
    // {
    //   'type':'',
    //   'icon':''
    // }
  ];
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
        children: List.generate(
          _qrType.length,
          (index) => NiceListTile(
            titleText: _qrType[index]['type'],
            iconData: _qrType[index]['icon'],
            onTap: () {
              Get.off(() => WebsiteQRCode(
                    urlType: _qrType[index]['type'],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
