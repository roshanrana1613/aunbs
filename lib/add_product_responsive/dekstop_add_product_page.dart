import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/client_details.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DekstopAddProductPage extends StatelessWidget {
  DekstopAddProductPage({super.key});
  final addItemController = Get.find<AddItemController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: "Add New Product",
          action: [
            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child:
                      screenWidth < 380
                          ? MyAddItemButton(
                            width: 150,
                            label: "Save Product",
                            icon: Icons.save,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addItemController.saveProduct();
                                Get.snackbar(
                                  'Success',
                                  'Product saved successfully',
                                );
                                Get.offNamed(Routes.productPage);
                              }
                            },
                          )
                          : MyAddItemButton(
                            label: "Save Product",
                            icon: Icons.save,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addItemController.saveProduct();
                                Get.snackbar(
                                  'Success',
                                  'Product saved successfully',
                                );
                                Get.offNamed(Routes.productPage);
                              }
                            },
                          ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 600,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer,
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
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Wrap(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Add New Product",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      ClientDetails(
                                        controller:
                                            addItemController.productName,
                                        labelName: 'Product Name',
                                        hintText: 'Enter product name',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Product name required!";
                                          }
                                          return null;
                                        },
                                        icon: null,
                                      ),
                                      const SizedBox(height: 30),
                                      ClientDetails(
                                        controller: addItemController.brandName,
                                        keyboardType: TextInputType.phone,
                                        labelName: 'Brand',
                                        hintText: 'Enter brand name',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Brand name required!";
                                          }
                                          return null;
                                        },
                                        icon: null,
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ClientDetails(
                                              controller:
                                                  addItemController
                                                      .productPrice,
                                              keyboardType: TextInputType.phone,
                                              labelName: 'Price (\u20B9)',
                                              hintText: '0.00',
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Price required!";
                                                }
                                                return null;
                                              },
                                              icon: null,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: ClientDetails(
                                              controller:
                                                  addItemController
                                                      .productQuntity,
                                              keyboardType: TextInputType.phone,
                                              labelName: 'Quantity',
                                              hintText: '0',
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Quantity required!";
                                                }
                                                return null;
                                              },
                                              icon: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      ClientDetails(
                                        controller:
                                            addItemController.sizeVariant,
                                        keyboardType: TextInputType.phone,
                                        labelName: 'Size/Variant',
                                        hintText: 'e.g., Large, 500ml, etc.',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Size/Variant required!";
                                          }
                                          return null;
                                        },
                                        icon: null,
                                      ),
                                      const SizedBox(height: 30),
                                      ClientDetails(
                                        controller:
                                            addItemController
                                                .productDescription,
                                        labelName: 'Description',
                                        hintText: 'Product description',
                                        maxLines: 3,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Product description is required!";
                                          }
                                          return null;
                                        },
                                        icon: null,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: SizedBox(
                          height: 600,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer,
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
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 30),
                                  ClientDetails(
                                    controller: addItemController.customCode,
                                    keyboardType: TextInputType.phone,
                                    labelName: 'Custom Code',
                                    hintText:
                                        'Enter custom code (e.g., ABC123)',
                                    validator: (value) {
                                      final price =
                                          addItemController.productPrice.text
                                              .trim();
                                      if (value == null || value.isEmpty) {
                                        return "Custom Code required!";
                                      }

                                      String mapDigitToChar(String digit) {
                                        if (digit == '0') return '0';
                                        int num = int.tryParse(digit) ?? -1;
                                        if (num >= 1 && num <= 9) {
                                          return String.fromCharCode(
                                            64 + num,
                                          ); // 1 -> A (65), 2 -> B ...
                                        }
                                        return digit; // Fallback
                                      }

                                      final expectedCode =
                                          price
                                              .split('')
                                              .map(mapDigitToChar)
                                              .join();

                                      if (value.toUpperCase() != expectedCode) {
                                        return "Custom Code doesn't match the price!";
                                      }

                                      return null;
                                    },
                                    icon: null,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "  Letters will be converted to numbers: A=1, B=2, etc.",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          elevation: 2,

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              7,
                                            ),
                                            side: BorderSide(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.secondary,
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Generate\nMapping",
                                            style: TextStyle(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.secondary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MyAddItemButton(
                                          label: "Generate Barcode",
                                          icon: Icons.qr_code_2,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final qrdata =
                                                  addItemController
                                                      .generateBarcode();
                                              addItemController.barcode.value =
                                                  qrdata;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Center(
                                    child: Obx(() {
                                      if (addItemController.barcode.isEmpty) {
                                        return SizedBox.shrink();
                                      }

                                      final barcode = Barcode.code128();

                                      final svg = barcode.toSvg(
                                        addItemController.barcode.value,
                                        width: 300,
                                        height: 100,
                                        drawText: false,
                                      );

                                      return Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            SvgPicture.string(svg),
                                            SizedBox(height: 8),
                                            Text(
                                              addItemController.customCode.text
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );

                                      // return SvgPicture.string(svg);
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
