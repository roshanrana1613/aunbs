import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/card_list.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileInovieList extends StatelessWidget {
  MobileInovieList({super.key});

  final invoiceController = Get.find<InvoiceController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: MyAppBar(
          title: "Invoices",
          action: [
            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child:
                      screenWidth < 380
                          ? MyAddItemButton(
                            width: 140,
                            label: "New Invoice",
                            icon: Icons.add_circle_outline,
                            onPressed: () {
                              Get.offNamed(Routes.createInvoice);
                            },
                          )
                          : MyAddItemButton(
                            label: "New Invoice",
                            icon: Icons.add_circle_outline,
                            onPressed: () {
                              Get.offNamed(Routes.createInvoice);
                            },
                          ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: MySearchField(hintText: "Search by No, Client, Date"),
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
