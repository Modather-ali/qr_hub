import 'package:qr_hub/packages.dart';

class QrItemCard extends StatefulWidget {
  const QrItemCard({Key? key}) : super(key: key);

  @override
  _QrItemCardState createState() => _QrItemCardState();
}

class _QrItemCardState extends State<QrItemCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        title: Text('https://'),
        subtitle: Text('data'),
        leading: Icon(Icons.qr_code),
      ),
    );
  }
}
