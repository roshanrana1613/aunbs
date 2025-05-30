import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
      // theme: _buildTheme(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }

  // ThemeData _buildTheme() {
  //   return ThemeData(
  //     colorScheme: ColorScheme.light(
  //       primary: Colors.orange,
  //       secondary: Colors.deepOrange,
  //     ),
  //     textSelectionTheme: const TextSelectionThemeData(
  //       selectionColor: Colors.orangeAccent,
  //       selectionHandleColor: Colors.deepOrange,
  //     ),
  //     appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
  //   );
  // }
}
