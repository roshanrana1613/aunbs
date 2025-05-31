import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DekstopViewProduct extends StatelessWidget {
  DekstopViewProduct({super.key});

  final Product? productDetails = Get.arguments;
  final addItemController = Get.find<AddItemController>();

  @override
  Widget build(BuildContext context) {
    if (productDetails == null) {
      return Scaffold(
        appBar: MyAppBar(title: "Product Details"),
        body: Center(
          child: Text(
            "No product details available.",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(title: "Product Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left: Product Details
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(35),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productDetails!.brand,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildDetail("Brand", productDetails!.productName),
                      _buildDetail("Price", productDetails!.price.toString()),
                      _buildDetail(
                        "Size/Variant",
                        productDetails!.size.toString(),
                      ),
                      _buildDetail(
                        "Quantity in Stock",
                        productDetails!.quantity.toString(),
                      ),
                      _buildDetail("Description", productDetails!.description),
                    ],
                  ),
                ),
              ),

              /// Right: Barcode and Code
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: 550,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(35),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Custom Code",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          productDetails!.customCode.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Barcode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Center(
                          child: Builder(
                            builder: (_) {
                              if (productDetails!.barcode.isEmpty) {
                                return const SizedBox.shrink();
                              }

                              try {
                                final barcode = Barcode.code128();
                                final svg = barcode.toSvg(
                                  productDetails!.barcode,
                                  width: 300,
                                  height: 100,
                                  drawText: false,
                                );

                                return Column(
                                  children: [
                                    SvgPicture.string(svg),
                                    const SizedBox(height: 8),
                                    Text(
                                      productDetails!.customCode.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              } catch (e) {
                                return const Text(
                                  "Error generating barcode",
                                  style: TextStyle(color: Colors.red),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 15)),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 25)),
        ],
      ),
    );
  }
}
