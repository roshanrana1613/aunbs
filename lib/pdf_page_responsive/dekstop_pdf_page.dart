import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DekstopPdfPage extends StatelessWidget {
  DekstopPdfPage({super.key});
  final addItemController = Get.find<AddItemController>();
  final Invoice saveInvoice = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Invoice",
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: MyAddItemButton(
              width: 135,
              label: "Download PDF",
              icon: Icons.print,
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 400,
            right: 400,
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
                            "Invoice No: ${saveInvoice.details.invoiceNumber}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date: ${saveInvoice.details.invoiceDate}",
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
                    saveInvoice.details.name,
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
                    saveInvoice.details.number,
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
                  // Headings row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          "Item",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Quantity",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Rate",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "GST",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Tax",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: saveInvoice.items.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 40,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final item = saveInvoice.items[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              item.name.text,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.quantity.text,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.rate.text,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.gst.text,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "\u20B9 ${item.tax.text}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "\u20B9 ${item.total.text}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Subtotal: \u20B9 ${saveInvoice.details.subTotal}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Total GST: \u20B9 ${saveInvoice.details.total - saveInvoice.details.subTotal}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Total: \u20B9 ${saveInvoice.details.total}",
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
                  Center(child: Text(saveInvoice.details.notes)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
