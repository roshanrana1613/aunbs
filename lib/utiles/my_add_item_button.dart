import 'package:flutter/material.dart';

class MyAddItemButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  final double width;

  const MyAddItemButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            // side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(7),
          ),
          elevation: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
