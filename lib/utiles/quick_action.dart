import 'package:flutter/material.dart';

class QuickAction extends StatelessWidget {
  final VoidCallback onpressed;
  final String buttonName;
  final Icon icon;
  const QuickAction({
    super.key,
    required this.onpressed,
    required this.buttonName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 0.4),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: 10),
          Text(
            maxLines: 1,
            buttonName,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
