import 'dart:typed_data';

import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/controller/barcode_controller.dart';
import 'package:anubs_invoice_app/model/product.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MobileViewProduct extends StatelessWidget {
  MobileViewProduct({super.key});
  final ProductData productDetails = Get.arguments;
  // final ProductData productDetails = Get.arguments as ProductData;
  final addItemController = Get.find<AddItemController>();
  final barcodeController = Get.find<BarcodeController>();
  
  Future<Uint8List> _generateBarcodePdf(PdfPageFormat format) async {
    final pdf = pw.Document();
    final barcode = Barcode.code128();
    final product = productDetails.productName ?? "UNKNOWN";
    final brand = productDetails.brand ?? "UNKNOWN";
    final price = productDetails.price ?? 0.0;
    final barcodeValue = "$brand-$product-${price.toStringAsFixed(2)}";

    // Generate the SVG barcode once
    final svg = barcode.toSvg(
      barcodeValue,
      width: 100,
      height: 40,
      drawText: false,
    );

    const int numberOfCopies = 27;
    const int itemsPerRow = 3;
    double itemWidth = (PdfPageFormat.a4.availableWidth - 48) / itemsPerRow;
    const double itemSpacing = 12;
    const double verticalSpacing = 12;

    // Create all barcode widgets
    final List<pw.Widget> barcodeWidgets = List.generate(numberOfCopies, (
      index,
    ) {
      return pw.Container(
        width: itemWidth,
        margin: const pw.EdgeInsets.only(bottom: 5, left: 20),
        alignment: pw.Alignment.center,
        padding: const pw.EdgeInsets.all(8),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColors.grey),
        ),
        child: pw.Column(
          children: [
            pw.SvgImage(svg: svg),
            pw.SizedBox(height: 6),
            pw.Text(
              productDetails.customCode.toString().toUpperCase(),
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 7),
            ),
            pw.Text(
              barcodeController.barcode.value,
              style: const pw.TextStyle(fontSize: 10),
              textAlign: pw.TextAlign.center,
            ),
          ],
        ),
      );
    });

    // Chunk barcodes into pages
    const int itemsPerPage = 3 * 9; // 3 per row × 9 rows = 27 items per A4 page
    for (int i = 0; i < barcodeWidgets.length; i += itemsPerPage) {
      final pageItems = barcodeWidgets.sublist(
        i,
        (i + itemsPerPage > barcodeWidgets.length)
            ? barcodeWidgets.length
            : i + itemsPerPage,
      );

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(16),
          build: (pw.Context context) {
            return pw.Wrap(
              spacing: itemSpacing,
              runSpacing: verticalSpacing,
              children: pageItems,
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  // Print the barcode document
  Future<void> _printBarcode(BuildContext context) async {
    try {
      await Printing.layoutPdf(
        onLayout: (format) => _generateBarcodePdf(format),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Printing error: $e')));
    }
  }

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
                      productDetails.brand!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text("Brand", style: TextStyle(fontSize: 15)),
                    Text(
                      productDetails.productName!,
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
                      productDetails.description!,
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
                        productDetails.customCode!.toUpperCase(),
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
                            child: Center(child: _buildBarcode(productDetails)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: MyAddItemButton(
                        width: 150,
                        label: "Print Barcode",
                        icon: Icons.print,
                        onPressed: () {
                          _printBarcode(context);
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
}

Widget _buildBarcode(ProductData productDetails) {
  try {
    final brand = productDetails.brand ?? "UNKNOWN";
    final product = productDetails.productName ?? "UNKNOWN";
    final price = productDetails.price ?? 0.0;
    final barcodeValue = "$brand-$product-${price.toStringAsFixed(2)}";

    if (barcodeValue.isEmpty) {
      return Text("No barcode available", style: TextStyle(color: Colors.grey));
    }

    final barcode = Barcode.code128();
    final svg = barcode.toSvg(
      barcodeValue,
      width: 300,
      height: 100,
      drawText: false,
    );

    return Column(
      children: [
        SvgPicture.string(svg),
        SizedBox(height: 8),
        Text(
          productDetails.customCode.toString().toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  } catch (e) {
    return Text(
      "Error generating barcode",
      style: TextStyle(color: Colors.red),
    );
  }
}
