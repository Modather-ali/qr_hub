import 'package:qr_hub/packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initService();
  runApp(const MyApp());
}

Future initService() async {
  await Get.putAsync(() => ThemeController().init());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController _themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QrHub',
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: Locale(_themeController.local),
      translations: AppLocale(),
      home: const HomeScreen(),
    );
  }
}
