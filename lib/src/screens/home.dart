import 'dart:developer';

import 'package:qr_hub/packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QRController _controller = Get.put(QRController());

  @override
  void initState() {
    _controller.readData();
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
          onPressed: () async {},
          icon: const Icon(Icons.settings_outlined),
          color: Colors.purple,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<QRController>(builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 100),
          itemCount: _controller.qrModelsDataList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(_controller.qrModelsDataList[index].id),
              child: QrItemCard(qrModel: _controller.qrModelsDataList[index]),
              onDismissed: (direction) async {
                await _controller.deleteData(
                    _controller.qrModelsDataList[index].id, index);
                ScaffoldMessenger.of(context).showSnackBar(
                  superSnackBar(
                    context,
                    message: "aaa",
                  ),
                );
              },
            );
          },
        );
      }),
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
