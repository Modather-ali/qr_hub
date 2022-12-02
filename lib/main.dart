import 'package:qr_hub/packages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrHub',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
