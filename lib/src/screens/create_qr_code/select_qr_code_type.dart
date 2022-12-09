import 'package:qr_hub/packages.dart';

class SelectQrCodeType extends StatefulWidget {
  const SelectQrCodeType({Key? key}) : super(key: key);

  @override
  _SelectQrCodeTypeState createState() => _SelectQrCodeTypeState();
}

class _SelectQrCodeTypeState extends State<SelectQrCodeType> {
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
        title: Text(
          'Create Qr Code'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: List.generate(
          _qrType.length,
          (index) => NiceListTile(
            titleText: _qrType[index]['type'].toString().tr,
            iconData: _qrType[index]['icon'],
            onTap: () {
              Get.off(() => CreateQRCodePage(
                    urlType: _qrType[index]['type'],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
