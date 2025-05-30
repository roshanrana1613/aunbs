import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileScreen,
    required this.tablatScreen,
    required this.dekstopScreen,
  });
  final Widget mobileScreen;
  final Widget tablatScreen;
  final Widget dekstopScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScreen;
        } else if (constraints.maxWidth < 1100) {
          return tablatScreen;
        } else {
          return dekstopScreen;
        }
      },
    );
  }
}
