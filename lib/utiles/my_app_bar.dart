import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  final Widget? leading;

  const MyAppBar({super.key, required this.title, this.action, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: leading,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
      ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
