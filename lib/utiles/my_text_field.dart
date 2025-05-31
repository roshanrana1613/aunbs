import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Widget? labelName;
  final TextInputType keyboardType; // Corrected parameter name (camelCase)
  final TextEditingController controller;
  final IconButton? iconButton;
  final void Function(String)? onChanged;
  final bool readOnly; // Added readOnly parameter

  const MyTextField({
    super.key,
    required this.hintText,
    this.labelName,
    required this.controller,
    this.iconButton,
    this.onChanged,
    required this.keyboardType, // Corrected parameter name
    this.readOnly = false, // Default value for readOnly
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      readOnly: readOnly, // Added readOnly property
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        label: labelName,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: iconButton,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.black, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
