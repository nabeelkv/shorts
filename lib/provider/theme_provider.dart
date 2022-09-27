import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Color(0xFF444444)),
        iconTheme: IconThemeData(color: Color(0xFF444444)),
      ),
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontFamily: 'Baloo Chettan 2',
              fontSize: 20,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Color(0xFF606060))),
      iconTheme: const IconThemeData(color: Color(0xFF444444)),
      colorScheme: const ColorScheme.light(),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.black54,
        refreshBackgroundColor: Colors.white70,
      ));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF212121),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white70),
        iconTheme: IconThemeData(color: Color(0xFFAAAAAA)),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            fontFamily: 'Baloo Chettan 2',
            fontSize: 20,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Color(0xFFAAAAAA)),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      colorScheme: const ColorScheme.dark(),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white70,
        refreshBackgroundColor: Colors.black54,
      ));
}
