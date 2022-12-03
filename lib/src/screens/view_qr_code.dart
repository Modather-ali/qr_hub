import 'package:qr_hub/packages.dart';

class ViewQrCodeScreen extends StatefulWidget {
  const ViewQrCodeScreen({Key? key}) : super(key: key);

  @override
  _ViewQrCodeScreenState createState() => _ViewQrCodeScreenState();
}

class _ViewQrCodeScreenState extends State<ViewQrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3),
                        ),
                      ),
                      Container(
                        height: 260,
                        width: 200,
                        color: Colors.white,
                      ),
                      Container(
                        height: 200,
                        width: 260,
                        color: Colors.white,
                      ),
                      Image.asset(
                        'assets/images/qr_code.jpg',
                        height: 245,
                        width: 245,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'https//flutter.dev',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  OptionButton(
                    option: 'Edit',
                    color: Colors.blue,
                    iconData: Icons.edit,
                  ),
                  OptionButton(
                    option: 'Delete',
                    color: Colors.red,
                    iconData: Icons.delete,
                  ),
                  OptionButton(
                    option: 'Share',
                    color: Colors.green,
                    iconData: Icons.share,
                  ),
                  OptionButton(
                    option: 'Save',
                    color: Colors.cyan,
                    iconData: Icons.download,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
