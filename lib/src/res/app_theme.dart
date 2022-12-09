import '../../packages.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Tajawal',
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    // titleTextStyle: TextStyle(color: Colors.black),
  ),
  primarySwatch: Colors.purple,
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.purple,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.purple,
  ),
);
