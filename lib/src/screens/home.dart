import 'package:qr_hub/packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QRController _controller = Get.put(QRController());
  bool _isLoading = false;
  _getDate() async {
    setState(() {
      _isLoading = true;
    });
    await _controller.readData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.purple,
        ),
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
        centerTitle: true,
        elevation: 1,
      ),
      drawer: SideDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<QRController>(builder: (_) {
        return Visibility(
          visible: !_isLoading,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 100),
            itemCount: _controller.qrModelsDataList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(_controller.qrModelsDataList[index].id),
                background: Container(
                  color: Colors.red.withOpacity(0.7),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                ),
                confirmDismiss: (direction) => Future.delayed(
                  const Duration(seconds: 1),
                  () => true,
                ),
                child: QrItemCard(
                    qrModel: _controller.qrModelsDataList[index], index: index),
                onDismissed: (direction) async {
                  await _controller.deleteData(
                      _controller.qrModelsDataList[index].id, index);
                  Get.snackbar("You have deleted",
                      _controller.qrModelsDataList[index].url,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15));
                },
              );
            },
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.to(() => const SelectQrCodeType());
              // Get.to(() => const CreateQrCodePage());
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
