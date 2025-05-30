import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utiles/card_list.dart';

class MobileInovieList extends StatelessWidget {
  MobileInovieList({super.key});
  final addItemController = Get.find<AddItemController>();

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
                              // Navigator.of(context).pop();
                            },
                          )
                          : MyAddItemButton(
                            label: "New Invoice",
                            icon: Icons.add_circle_outline,
                            onPressed: () {
                              Get.offNamed(Routes.createInvoice);
                              // Navigator.of(context).pop();
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
                        return CardList(index: index, invoice: saveInvoice);
                        // return Padding(
                        //   padding: const EdgeInsets.only(bottom: 10),
                        //   child: Card(
                        //     color:
                        //         Theme.of(context).colorScheme.surfaceContainer,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(7),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(12),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 child: Text(
                        //                   "Invoice No: ${saveInvoice.details.invoiceNumber}",
                        //                   style: const TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 18,
                        //                   ),
                        //                 ),
                        //               ),
                        //               IconButton(
                        //                 onPressed: () {
                        //                   Get.toNamed(
                        //                     "/pdfPage",
                        //                     arguments: saveInvoice,
                        //                   );
                        //                 },
                        //                 icon: Icon(
                        //                   Icons.remove_red_eye_outlined,
                        //                   color: Colors.blue,
                        //                 ),
                        //                 style: ButtonStyle(
                        //                   splashFactory: NoSplash.splashFactory,
                        //                 ),
                        //               ),
                        //               IconButton(
                        //                 onPressed: () {
                        //                   addItemController.savedInvoices
                        //                       .removeAt(index);
                        //                 },
                        //                 icon: Icon(
                        //                   Icons.delete,
                        //                   color: Colors.red,
                        //                 ),
                        //                 style: ButtonStyle(
                        //                   splashFactory: NoSplash.splashFactory,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           const SizedBox(height: 8),
                        //           Text(
                        //             "Client: ${saveInvoice.details.name}",
                        //             style: const TextStyle(fontSize: 16),
                        //           ),
                        //           const SizedBox(height: 4),
                        //           Text(
                        //             "Date: ${saveInvoice.details.invoiceDate}",
                        //             style: const TextStyle(fontSize: 16),
                        //           ),
                        //           const SizedBox(height: 4),
                        //           Text(
                        //             "Amount: ₹ ${saveInvoice.details.total}",
                        //             style: const TextStyle(fontSize: 16),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
