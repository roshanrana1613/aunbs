import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_item_controller.dart';

class CardList extends StatelessWidget {
  final Invoice? invoice;
  final Product? product;
  final int index;

  const CardList({super.key, this.invoice, this.product, required this.index})
    : assert(
        invoice != null || product != null,
        'Either invoice or product must be provided.',
      );

  @override
  Widget build(BuildContext context) {
    final addItemController = Get.find<AddItemController>();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (invoice != null) ...[
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
                          "Invoice No: ${invoice!.details.invoiceNumber}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed("/pdfPage", arguments: invoice);
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
                          addItemController.savedInvoices.removeAt(index);
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
                    "Client: ${invoice!.details.name}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Date: ${invoice!.details.invoiceDate}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Amount: ₹ ${invoice!.details.total.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ] else if (product != null) ...[
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
                          "Product Name: ${product!.productName}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Define your product edit/view logic here
                          Get.toNamed(Routes.viewProduct, arguments: product!);
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
                          // Remove product logic here
                          addItemController.productList.removeAt(index);
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
                    "Brand: ${product!.brand}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Price: ₹ ${product!.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Quantity: ${product!.quantity}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Custom Code: ${product!.customCode}",
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
