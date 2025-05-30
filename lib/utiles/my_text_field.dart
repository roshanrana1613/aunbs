import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Widget? labelName;
  final TextInputType keyboardtype;
  final TextEditingController controller;
  final IconButton? iconButton;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.hintText,
    this.labelName,
    required this.controller,
    this.iconButton,
    this.onChanged,
    required this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardtype,
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
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.5,
          ), // Remove border to rely on container
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.blue), // Focused border
        ),
      ),
    );
  }
}
