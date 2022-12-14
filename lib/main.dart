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

class MyApp extends GetView<ThemeController> {
  const MyApp({super.key});

  // final ThemeController _themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QrHub',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: controller.isDark ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(controller.local),
      translations: AppLocale(),
      home: const HomeScreen(),
    );
  }
}
