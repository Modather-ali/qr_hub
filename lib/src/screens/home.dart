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
        centerTitle: true,
        elevation: 1,
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {},
            tooltip: '',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {},
            tooltip: '',
            child: const Icon(Icons.qr_code_scanner_rounded),
          ),
        ],
      ),
    );
  }
}
