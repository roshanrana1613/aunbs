import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import '../controller/page_controller.dart';

class MyDrawer extends StatelessWidget {
  final pageController = Get.find<MyPageController>();

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header or Logo
                Row(
                  children: [
                    SizedBox(width: 12),
                    Text(
                      "AUNBS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(color: Colors.grey, thickness: 0.6),

                // Drawer items
                _buildDrawerItem(
                  text: "Dashboard",
                  icon: Icons.dashboard,
                  iconBgColor: Colors.orangeAccent,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.bodyPages);
                  },
                ),
                _buildDrawerItem(
                  text: "Invoice",
                  icon: Icons.document_scanner,
                  iconBgColor: Colors.greenAccent,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.invoicesList);
                  },
                ),
                _buildDrawerItem(
                  text: "Products",
                  icon: Icons.shop,
                  iconBgColor: Colors.blueAccent,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.productPage);
                  },
                ),
                _buildDrawerItem(
                  text: "Clients",
                  icon: Icons.group,
                  iconBgColor: Colors.pinkAccent,
                  onTap: () {
                    Get.back();

                    // Add your route here
                  },
                ),
                _buildDrawerItem(
                  text: "Settings",
                  icon: Icons.settings,
                  iconBgColor: Colors.black87,
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.settings);
                    // Add your route here
                  },
                ),
                const SizedBox(height: 24), // 👍 Safe alternative to Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String text,
    required IconData icon,
    required Color iconBgColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        decoration: BoxDecoration(
          color: iconBgColor.withAlpha((0.1 * 255).toInt()),
          shape: BoxShape.rectangle,
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: iconBgColor),
      ),
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
