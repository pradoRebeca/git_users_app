import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkPurple = Color.fromRGBO(118, 113, 186, 1);
  static const Color lightPurple = Color.fromRGBO(241, 240, 250, 1);
  static const Color lightGrey = Color.fromRGBO(217, 217, 217, 1);
  static const Color lightBlack = Color.fromRGBO(59, 59, 59, 1);
  static const Color darkGrey = Color.fromRGBO(165, 168, 171, 1);
  static const Color error = Color.fromRGBO(219, 82, 97, 1);

  static ThemeData get theme {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: darkPurple,
            onPrimary: lightBlack,
            secondary: lightPurple,
            onSecondary: lightBlack,
            error: error,
            onError: error,
            surface: Colors.white,
            onSurface: lightBlack,
            onPrimaryContainer: darkGrey),
        textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 12),
            bodyMedium: TextStyle(fontSize: 14),
            bodyLarge: TextStyle(fontSize: 16)),
        iconTheme: const IconThemeData(color: darkPurple),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: darkGrey, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: darkGrey, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith<Color>(
                  (states) => Colors.white,
                ),
                textStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  (states) => const TextStyle(
                    fontSize: 16,
                  ),
                ),
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed)) {
                      return lightGrey;
                    }
                    return darkPurple;
                  },
                ),
                iconColor: WidgetStateProperty.resolveWith<Color>(
                  (states) => Colors.white,
                ))));
  }
}
