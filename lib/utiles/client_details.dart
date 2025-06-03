import 'package:flutter/material.dart';

class ClientDetails extends StatelessWidget {
  final String labelName;
  final String hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final IconButton? icon;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final Function(String)? onChanged;
  final bool autofocus;
  final String? Function(String?)? validator;
  final bool? enable;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;

  const ClientDetails({
    super.key,
    required this.labelName,
    required this.hintText,
    this.maxLines = 1,
    this.controller,
    this.icon,
    this.textAlign,
    this.keyboardType,
    this.textStyle,
    this.onChanged,
    this.autofocus = false,
    this.validator,
    this.enable,
    this.contentPadding,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: textInputAction ?? TextInputAction.next,
      onEditingComplete:
          onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enable ?? true,
      autofocus: autofocus,
      onChanged: onChanged,
      style: textStyle,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      cursorColor: Colors.black,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: icon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        label: Text(
          labelName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        hintText: hintText,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
