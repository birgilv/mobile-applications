import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tabs.dart';

/*
 * Defines the main theme for the app using Material 3 design.
 * The theme uses a dark color scheme generated from a seed color.
 * Google Fonts package is used to apply the Lato font across the app.
 */
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

/*
 * The main function is the entry point of the Flutter app.
 * It runs the app by calling runApp() and passing the App widget.
 */
void main() {
  runApp(const App());
}

/*
 * The App widget is the root of the application.
 * It sets up the MaterialApp with the defined theme and shows the TabsScreen as the home screen.
 */
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}