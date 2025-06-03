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
    // Debug print to check the invoice data
    print("Invoice Data: ${invoiceData.toJson()}");
    print("Items count: ${invoiceData.items?.length ?? 0}");
    invoiceData.items?.forEach((item) {
      print("Item details: ${item.toJson()}");
    });

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
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date: ${invoiceData.invoiceDate}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey, height: 50, thickness: 1),

                  // Client information
                  const Text(
                    "Bill To:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    invoiceData.clientName ?? "No client name",
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
                    invoiceData.contactNumber?.toString() ??
                        "No contact number",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(color: Colors.grey, height: 50, thickness: 1),

                  // Items section
                  const Text(
                    "Items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Items table
                  if (invoiceData.items == null || invoiceData.items!.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "No items in this invoice",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  else
                    Column(
                      children:
                          invoiceData.items!.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  _buildKeyValueRow(
                                    "Item",
                                    item.description.text,
                                  ),
                                  _buildKeyValueRow(
                                    "Quantity",
                                    item.quantity.text,
                                  ),
                                  _buildKeyValueRow(
                                    "Rate",
                                    "₹ ${item.rate.text}",
                                  ),
                                  _buildKeyValueRow("GST", "${item.gst.text}%"),
                                  _buildKeyValueRow(
                                    "Total",
                                    "₹ ${item.total.text}",
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),

                  // const Divider(thickness: 1),
                  const SizedBox(height: 20),
                  // Totals section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Subtotal: \u20B9 ${invoiceData.subtotal?.toStringAsFixed(2) ?? "0.00"}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Total GST: \u20B9 ${((invoiceData.grandTotal ?? 0) - (invoiceData.subtotal ?? 0)).toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 8),
                          Text(
                            "Grand Total: \u20B9 ${invoiceData.grandTotal?.toStringAsFixed(2) ?? "0.00"}",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildKeyValueRow(String key, String value) {
  return Row(
    children: [
      SizedBox(
        width: 100,
        child: Text(
          "$key:",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(child: Text(value)),
    ],
  );
}
