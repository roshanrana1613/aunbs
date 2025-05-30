import 'package:anubs_invoice_app/utiles/monthly_revune.dart';
import 'package:anubs_invoice_app/utiles/my_container.dart';
import 'package:anubs_invoice_app/utiles/recent_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TablatHomePage extends StatelessWidget {
  const TablatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> containerWidgets = [
      MyContainer(
        heading: "Total Revenue",
        value: "\$ 12,345",
        description: "+5.2% this month",
        icon: Icons.attach_money,
      ),
      MyContainer(
        heading: "Outstanding Invoices",
        value: "12",
        description: "3 overdue",
        icon: Icons.document_scanner,
      ),
      MyContainer(
        heading: "Active Clients",
        value: "87",
        description: "+2 new this week",
        icon: Icons.group,
      ),
      MyContainer(
        heading: "Paid Invoices",
        value: "156",
        description: "Avg.250 per invoice",
        icon: Icons.group,
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome to AUNBS\nDashboard",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
          ),
          const Text(
            "Here's your financial overview and recent activity.",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/newInvoicePage");
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create New Invoice",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2.4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: containerWidgets,
          ),
          const SizedBox(height: 30),
          MonthlyRevune(),

          const SizedBox(height: 30),
          RecentActivity(
            activityDeatails: "Invoice #INV-001 sent to Client X - 2 hours ago",
          ),
        ],
      ),
    );
  }
}
