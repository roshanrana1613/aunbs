import 'package:anubs_invoice_app/appearance_responsive/mobile_appearance.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileSettings extends StatelessWidget {
  const MobileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Settings"),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            settingsContainer(
              context,
              icon: Icon(Icons.dark_mode_outlined, size: 30),
              name: 'Appearance',
              description: 'Customize Light mod and dark mod',
              onPressed: () {
                Get.to(MobileAppearance());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget settingsContainer(
  BuildContext context, {
  required Icon icon,
  required String name,
  required String description,
  required VoidCallback onPressed,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: Theme.of(context).colorScheme.surfaceContainer,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(30),
          blurRadius: 10,
          spreadRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(description),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            child: Text(
              "Manage Settings",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ),
      ],
    ),
  );
}
