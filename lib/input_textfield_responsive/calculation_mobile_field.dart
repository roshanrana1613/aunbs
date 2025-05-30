import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/utiles/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationMobileField extends StatelessWidget {
  final Item? itemToEdit;
  final int? index;

  CalculationMobileField({super.key, this.itemToEdit, this.index});

  final addItemController = Get.find<AddItemController>();
  final List<String> gstPercentages = ['5%', '12%', '18%', '28%'];

  void _showGstDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            title: const Text("Select GST"),
            children:
                gstPercentages.map((gst) {
                  return SimpleDialogOption(
                    child: Text(gst),
                    onPressed: () {
                      gst = gst;
                      Navigator.pop(context);
                      addItemController
                          .calculateTotal(); // recalculate after selection
                    },
                  );
                }).toList(),
          ),
    );
  }

  void _handleInit() {
    if (itemToEdit != null) {
      // addItemController.editItem(itemToEdit!);
    } else {
      // addItemController.clearFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    _handleInit(); // Called once per build

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Item",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: ListView.builder(
          itemCount: addItemController.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = addItemController.items[index];

            return Column(
              children: [
                MyTextField(
                  hintText: "Item Name",
                  controller: item.name,
                  onChanged: (_) => addItemController.calculateTotal(),
                  keyboardtype: TextInputType.text,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  hintText: "Quantity",
                  controller: item.name,
                  onChanged: (_) => addItemController.calculateTotal(),
                  keyboardtype: TextInputType.number,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  hintText: "Rate",
                  controller: item.rate,
                  onChanged: (_) => addItemController.calculateItem(item),
                  keyboardtype: TextInputType.number,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  hintText: "GST",
                  controller: item.gst,
                  onChanged: (_) => addItemController.calculateItem(item),
                  iconButton: IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () => _showGstDialog(context),
                  ),
                  keyboardtype: TextInputType.text,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  hintText: "Tax",
                  controller: item.tax,
                  onChanged: (_) => addItemController.calculateItem(item),
                  keyboardtype: TextInputType.number,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  hintText: "Total",
                  controller: item.total,
                  onChanged: (_) => addItemController.calculateItem(item),
                  keyboardtype: TextInputType.number,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          // addItemController.updateItem(index!);
                          Get.back();
                          Get.snackbar(
                            "Success",
                            "Item updated successfully",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green.shade100,
                            colorText: Colors.black,
                          );
                          // addItemController.ca();
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          shadowColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          // ignore: unnecessary_null_comparison
                          index != null ? "Update" : "Create",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
