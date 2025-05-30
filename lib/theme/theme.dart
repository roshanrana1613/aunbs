// import 'package:flutter/material.dart';

// final ThemeData lightMode = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   scaffoldBackgroundColor: Color(0xFFFFFDF6),
//   colorScheme: ColorScheme.light(
//     primary: Color(0xFFDDEB9D), // Buttons, app bar
//     onPrimary: Colors.black, // Text/icons on buttons
//     secondary: Color.fromARGB(200, 74, 171, 15), // FABs, highlights
//     onSecondary: Colors.black,
//     surface: Color(0xfffffdf6),
//     surfaceContainer: Color(0xfffaf6e9), // Cards, containers
//     onSurface: Colors.black,
//     error: Colors.red.shade700,
//     onError: Colors.white,
//   ),
// );

// final ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   useMaterial3: true,
//   scaffoldBackgroundColor: Color(0xFF1A1A1A), // or a dark tone
//   colorScheme: ColorScheme.dark(
//     primary: Color(0xFFA0C878), // Softer green
//     onPrimary: Colors.black,
//     secondary: Color(0xFFDDEB9D),
//     onSecondary: Colors.black,
//     surface: Color(0xFF2C2C2C), // Dark card background
//     onSurface: Colors.white,
//     error: Colors.red.shade400,
//     onError: Colors.black,
//   ),
// );

import 'package:flutter/material.dart';

// ------------------- LIGHT MODE ------------------------
final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,

  // Background color of Scaffold (e.g. main screen)
  scaffoldBackgroundColor: Color(0xFFFFFDF6),

  colorScheme: ColorScheme.light(
    primary: Color(0xFFDDEB9D),

    // ^ Used for AppBar background, ElevatedButton background, etc.
    onPrimary: Colors.black,

    // ^ Text/icons on top of primary color (like on AppBar title or button text)
    secondary: Color.fromARGB(200, 74, 171, 15),

    // ^ Used for highlights, FloatingActionButton, toggles
    onSecondary: Colors.black,

    // ^ Text/icons on secondary color background
    surface: Color(0xfffffdf6),

    // ^ Used as background for Cards, Dialogs, Menus
    // surfaceContainer: Color(0xfffaf6e9),
    surfaceContainer: const Color.fromARGB(255, 238, 243, 238),

    // ^ Custom key: used in your app manually for Cards/Containers
    onSurface: Colors.black,

    // ^ Text/icons on surface
    error: Colors.red.shade700,
    onError: Colors.white,
  ),
);

// ------------------- DARK MODE ------------------------
final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,

  // Background color of Scaffold
  scaffoldBackgroundColor: Color(0xFF1A1A1A),

  colorScheme: ColorScheme.dark(
    primary: Color(0xFFA0C878),

    // ^ Used for AppBar background, ElevatedButton background, etc.
    onPrimary: Colors.black,

    // ^ Text/icons on top of primary color
    secondary: Color(0xFFDDEB9D),

    // ^ Used for FloatingActionButton or accent elements
    onSecondary: Colors.black,
    surface: Color(0xFF2C2C2C),

    // ^ Card/Container background
    onSurface: Colors.white,
    error: Colors.red.shade400,
    onError: Colors.black,
  ),
);
