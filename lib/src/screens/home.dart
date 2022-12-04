import 'dart:developer';

import 'package:qr_hub/packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: const Text('QrHub')),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
          color: Colors.purple,
        ),
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          Dismissible(
            key: const Key('1'),
            child: const QrItemCard(),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                superSnackBar(
                  context,
                  message: "aaa",
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              log(DateUtil().formatted);
              Get.to(() => const CreateQrCodePage());
            },
            tooltip: 'Create Qr Code',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
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
