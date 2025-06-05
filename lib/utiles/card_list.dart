import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:anubs_invoice_app/controller/product_controller.dart';
import 'package:anubs_invoice_app/model/invoice.dart';
import 'package:anubs_invoice_app/model/product.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_item_controller.dart';

class CardList extends StatelessWidget {
  final InvoiceData? invoiceData;
  final ProductData? productData;
  final int index;

  const CardList({
    super.key,
    this.invoiceData,
    required this.index,
    this.productData,
  }) : assert(
         invoiceData != null || productData != null,
         'Either invoice or product must be provided.',
       );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (invoiceData != null) ...[
            // Invoice UI
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30),
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(7),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Invoice No: ${invoiceData!.subtotal}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (invoiceData != null) {
                            Get.toNamed(Routes.pdfPage, arguments: invoiceData);
                          } else {
                            Get.snackbar("Error", "Invoice data is missing");
                          }
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.blue,
                        ),
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Confirm Delete",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  "Are you sure you want to delete this item ?",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Get.back();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.find<InvoiceController>().deleteData(
                                        invoiceData!,
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Client: ${invoiceData!.clientName}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Date: ${Get.find<AddItemController>().formatDate(invoiceData!.invoiceDate.toString())}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Amount: ₹ ${invoiceData!.grandTotal.toString()}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ] else if (productData != null) ...[
            // Product UI only
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30),
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(7),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Product Name: ${productData!.productName}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Define your product edit/view logic here
                          if (productData != null) {
                            print(
                              "Passing product type: ${productData.runtimeType}",
                            );
                            Get.toNamed(
                              Routes.viewProduct,
                              arguments: productData,
                            );
                          } else {
                            Get.snackbar("Error", "Product data is missing");
                          }
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.blue,
                        ),
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Confirm Delete",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  "Are you sure you want to delete this item ?",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Get.back();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.find<ProductController>()
                                          .removeProduct(productData!);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Brand: ${productData!.brand}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Price: ₹ ${productData!.price!.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Quantity: ${productData!.quantity}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Custom Code: ${productData!.customCode!.toUpperCase()}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
