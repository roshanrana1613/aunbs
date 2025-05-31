import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MobileViewProduct extends StatelessWidget {
  MobileViewProduct({super.key});
  final Product productDetails = Get.arguments;
  final addItemController = Get.find<AddItemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(title: "Product Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
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
                      productDetails.brand,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text("Brand", style: TextStyle(fontSize: 15)),
                    Text(
                      productDetails.productName,
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Text("Price", style: TextStyle(fontSize: 15)),
                    Text(
                      productDetails.price.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Text("Size/Variant", style: TextStyle(fontSize: 15)),
                    Text(
                      productDetails.size.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Text("Quantity in Stock", style: TextStyle(fontSize: 15)),
                    Text(
                      productDetails.quantity.toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 30),
                    Text("Description", style: TextStyle(fontSize: 15)),
                    Text(
                      productDetails.description,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
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
                      "Custom Code",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        productDetails.customCode.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
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
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            width: constraints.maxWidth,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Center(
                              child:
                                  productDetails.barcode.isEmpty
                                      ? SizedBox.shrink()
                                      : _buildBarcode(productDetails),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarcode(Product productDetails) {
    try {
      final barcode = Barcode.code128();
      final svg = barcode.toSvg(
        productDetails.barcode,
        width: 300,
        height: 100,
        drawText: false,
      );
      return Column(
        children: [
          SvgPicture.string(svg),
          SizedBox(height: 8),
          Text(
            productDetails.customCode.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      );
    } catch (e) {
      print("Barcode generation error: $e");
      return Text(
        "Error generating barcode",
        style: TextStyle(color: Colors.red),
      );
    }
  }
}
