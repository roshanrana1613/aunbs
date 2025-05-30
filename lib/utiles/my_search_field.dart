import 'package:flutter/material.dart';

class MySearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;

  const MySearchField({
    super.key,
    this.hintText = "Search...",
    this.controller,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(width: 2)),

        prefixIcon: prefixIcon ?? const Icon(Icons.search),
      ),
    );
  }
}
