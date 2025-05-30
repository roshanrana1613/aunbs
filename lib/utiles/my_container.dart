// import 'dart:ui';
// import 'package:flutter/material.dart';

// class MyContainer extends StatelessWidget {
//   final String heading;
//   final String value;
//   final String description;
//   final IconData icon;

//   const MyContainer({
//     super.key,
//     required this.heading,
//     required this.value,
//     required this.description,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     // Adjust glass background colors based on theme
//     final glassGradient = LinearGradient(
//       colors:
//           isDark
//               ? [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.02)]
//           : [
//             Theme.of(context).colorScheme.surfaceContainer,
//             Theme.of(context).colorScheme.surfaceContainer,
//           ],
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
// );

// final borderColor =
//     isDark ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.3);

// final shadowColor =
//     isDark ? Colors.black.withOpacity(0.4) : Colors.grey.withOpacity(0.2);

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Stack(
//         children: [
//           // Blur behind the glass
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//             child: Container(),
//           ),
//           // Glass-like container
//           Container(
// width: double.infinity,
// // height: 500,
// padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
// decoration: BoxDecoration(
//   gradient: glassGradient,
//   border: Border.all(color: borderColor),
//   borderRadius: BorderRadius.circular(20),
//   boxShadow: [
//     BoxShadow(
//       color: shadowColor,
//       blurRadius: 12,
//       offset: Offset(0, 6),
//     ),
//   ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Text Section
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       heading,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       value,
//                       style: TextStyle(
//                         fontSize: 34,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(description, style: TextStyle(fontSize: 14)),
//                   ],
//                 ),
//                 // Icon Section
//                 Expanded(
//                   flex: 1,
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Icon(icon, size: 50),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String heading;
  final String value;
  final String description;
  // final Color containerColor;
  final IconData icon;

  const MyContainer({
    super.key,
    required this.heading,
    required this.value,
    required this.description,
    required this.icon,
    // required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarktheme = Theme.of(context).brightness == Brightness.dark;
    final isGlassgradient = LinearGradient(
      colors:
          isDarktheme
              ? [Colors.black.withAlpha(10), Colors.green.withAlpha(50)]
              : [
                Theme.of(context).colorScheme.surfaceContainer,
                Theme.of(context).colorScheme.surfaceContainer,
              ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    final borderColor = isDarktheme ? Colors.green : Colors.black;

    final shadowColor =
        isDarktheme ? Colors.black.withAlpha(30) : Colors.green.withAlpha(30);
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: isGlassgradient,
        border: Border.all(color: borderColor, width: 0.3),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  heading,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  value,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(icon, size: 45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
