import 'package:flutter/material.dart';

class DekstopSettings extends StatelessWidget {
  const DekstopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Text("dekstop settings"),
    );
  }
}
