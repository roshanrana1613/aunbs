import 'package:anubs_invoice_app/model/invoice.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfPage extends StatelessWidget {
  PdfPage({super.key});
  final InvoiceData invoiceData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Invoice",
        action: [
          LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = MediaQuery.of(context).size.width;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child:
                    screenWidth < 380
                        ? MyAddItemButton(
                          width: 160,
                          label: "Download PDF",
                          icon: Icons.print,
                          onPressed: () {},
                        )
                        : MyAddItemButton(
                          width: 135,
                          label: "Download PDF",
                          icon: Icons.print,
                          onPressed: () {},
                        ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "AUNBS",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("GSTIN: N/A"),
                            Text("Phone: N/A"),
                            Text("E-mail: N/A"),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "INVOICE",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "Invoice No: ${invoiceData.invoiceNumber}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date: ${invoiceData.invoiceDate}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, height: 50, thickness: 1),
                  const Text(
                    "Bill To:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${invoiceData.clientName}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Contact:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    invoiceData.contactNumber.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(color: Colors.grey, height: 50, thickness: 1),
                  const SizedBox(height: 10),
                  const Text(
                    "Total Items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: invoiceData.items!.length,
                    itemBuilder: (context, index) {
                      final item = invoiceData.items![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Item:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    item.description.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Quantity:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Rate:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "\u20B9 ${item.rate.toString()}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "GST:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    item.gST.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Tax:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "\u20B9 ${item.tax.toString()}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Total:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "\u20B9 ${item.total.toString()}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Subtotal: \u20B9 ${invoiceData.grandTotal!.toStringAsFixed(2)} ",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Total GST: \u20B9 ${(invoiceData.grandTotal! - invoiceData.subtotal!.toDouble()).toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Total: \u20B9 ${invoiceData.grandTotal}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Center(child: Text(invoiceData.)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
