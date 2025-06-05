import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/card_list.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DekstopInvoiceList extends StatelessWidget {
  DekstopInvoiceList({super.key});
  final addItemController = Get.find<AddItemController>();
  final invoiceController = Get.find<InvoiceController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,

        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: const Text(
                      "Invoices",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 300, // 👈 Set your desired width
                    child: MySearchField(
                      hintText: "Search by No, Client, Date...",
                      controller: null,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 45,
                    child: MyAddItemButton(
                      label: "New Invoice",
                      icon: Icons.add_circle_outline,
                      onPressed: () {
                        Get.offNamed(Routes.addProduct);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // In MobileInvoiceList.dart
              Expanded(
                child: Obx(() {
                  if (invoiceController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (invoiceController.invoiceList.isEmpty) {
                    return const Center(child: Text("No invoices found."));
                  }

                  return ListView.builder(
                    itemCount: invoiceController.invoiceList.length,
                    itemBuilder: (context, index) {
                      final invoice = invoiceController.invoiceList[index];
                      return CardList(index: index, invoiceData: invoice);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
