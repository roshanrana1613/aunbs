import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DekstopInvoiceList extends StatelessWidget {
  DekstopInvoiceList({super.key});
  final addItemController = Get.find<AddItemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: const Text(
                    "Invoices",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                const SizedBox(width: 40),
                SizedBox(
                  width: 300, // 👈 Set your desired width
                  child: MySearchField(hintText: "Search by No, Client, Date"),
                ),
                SizedBox(width: 20),
                SizedBox(
                  height: 45,
                  child: MyAddItemButton(
                    label: "New Invoice",
                    icon: Icons.add_circle_outline,
                    onPressed: () {
                      Get.offNamed(Routes.createInvoice);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Obx(() {
              final savedInvoices = addItemController.savedInvoices;

              if (savedInvoices.isEmpty) {
                return const Center(
                  child: Text(
                    "No invoices yet",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }

              return Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: savedInvoices.length,
                    itemBuilder: (context, index) {
                      final saveInvoice = savedInvoices[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Invoice No: ${saveInvoice.details.invoiceNumber}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.offNamed(
                                        "/pdfPage",
                                        arguments: saveInvoice,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.blue,
                                    ),
                                    style: ButtonStyle(
                                      splashFactory: NoSplash.splashFactory,
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      addItemController.savedInvoices.removeAt(
                                        index,
                                      );
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Client: ${saveInvoice.details.name}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Date: ${saveInvoice.details.invoiceDate}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Amount: ₹${saveInvoice.details.total}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
