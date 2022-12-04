import 'dart:developer';

import 'package:qr_hub/packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SqlDatabase _sqlDatabase = SqlDatabase();
  final List<QRModel> _qrModelList = [];
  _getData() async {
    List<Map<String, Object?>> data;
    QRModel qrModel;
    data = await _sqlDatabase.readData('SELECT * FROM QrCodes');
    for (var element in data) {
      qrModel = QRModel(
        element['id'].toString(),
        element['url'].toString(),
        element['date'].toString(),
        element['urlType'].toString(),
      );
      _qrModelList.add(qrModel);
    }
    setState(() {});
    log(_qrModelList.length.toString());
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
            shaderCallback: (bounds) {
              return const RadialGradient(
                colors: [
                  Colors.red,
                  Colors.purple,
                ],
                radius: 1,
              ).createShader(bounds);
            },
            child: const Text(
              'QrHub',
              style: null,
            )),
        titleTextStyle: null,
        leading: IconButton(
          onPressed: () async {
            await _getData();
          },
          icon: const Icon(Icons.settings_outlined),
          color: Colors.purple,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        itemCount: _qrModelList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_qrModelList[index].id),
            child: QrItemCard(qrModel: _qrModelList[index]),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                superSnackBar(
                  context,
                  message: "aaa",
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              log(DateUtil().currantDate);
              Get.to(() => const CreateQrCodePage());
            },
            tooltip: 'Create Qr Code',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: '',
            onPressed: () {
              Get.to(() => const ScannerPage());
            },
            tooltip: 'Scan Qr Code',
            child: const Icon(Icons.qr_code_scanner_rounded),
          ),
        ],
      ),
    );
  }
}
