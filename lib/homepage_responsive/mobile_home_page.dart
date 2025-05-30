import 'package:anubs_invoice_app/utiles/monthly_revune.dart';
import 'package:anubs_invoice_app/utiles/my_container.dart';
import 'package:anubs_invoice_app/utiles/recent_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
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
                //--------------------------------------------------------------------------Create anvoice button
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
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_right_alt,
                          color: Theme.of(context).colorScheme.onSecondary,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                //------------------------------------------------------ main color full containers
                MyContainer(
                  heading: "Total Revenue",
                  value: "\$ 12,345",
                  description: "+5.2% this month",
                  icon: Icons.attach_money,
                  // containerColor: Colors.lightGreen.shade100,
                ),
                const SizedBox(height: 20),
                MyContainer(
                  heading: "Outstanding Invoices",
                  value: "12",
                  description: "3 overdue ",
                  icon: Icons.document_scanner,

                  // containerColor: Colors.orange.shade100,
                ),
                const SizedBox(height: 20),
                MyContainer(
                  heading: "Active Clients",
                  value: "87",
                  description: "+2 new this week",
                  icon: Icons.group,
                  // containerColor: Colors.blue.shade100,
                ),
                const SizedBox(height: 20),
                MyContainer(
                  heading: "Paid Invoices",
                  value: "156",
                  description: "Avg.250 per invoice",
                  icon: Icons.group,

                  // containerColor: Colors.purple.shade100,
                ),
                const SizedBox(height: 30),
                MonthlyRevune(), //----------------------------------------------------- monthly revenu container
                const SizedBox(height: 30),
                //-----------------------------------------------------------------recent activity container and text
                RecentActivity(
                  activityDeatails:
                      "Invoice #INV-001 sent to Client X - 2 hours ago",
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
