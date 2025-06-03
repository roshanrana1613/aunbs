import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/controller/calculation_controller.dart';
import 'package:anubs_invoice_app/utiles/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/invoice.dart';

class CalculationMobileField extends StatelessWidget {
  final Item? itemToEdit;
  final int? index;

  CalculationMobileField({super.key, this.itemToEdit, this.index});

  final AddItemController addItemController = Get.find<AddItemController>();
  final CalculationController calculationController =
      Get.find<CalculationController>();
  final List<String> gstPercentages = ['5%', '12%', '18%', '28%'];

  void _showGstDialog(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            title: const Text("Select GST"),
            children:
                gstPercentages.map((gst) {
                  return SimpleDialogOption(
                    onPressed: () {
                      item.gst.text = gst;
                      Navigator.pop(context);
                      calculationController.calculateItem(item);
                    },
                    child: Text(gst),
                  );
                }).toList(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Item",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              for (int i = 0; i < addItemController.items.length; i++)
                _buildItemForm(addItemController.items[i], i, context),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addItemController.createItem,
                child: const Text("Add Another Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemForm(Item item, int index, BuildContext context) {
    return Column(
      children: [
        MyTextField(
          hintText: "Item Name",
          controller: item.description,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 30),
        MyTextField(
          hintText: "Quantity",
          controller: item.quantity,
          onChanged: (_) => calculationController.calculateItem(item),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 30),
        MyTextField(
          hintText: "Rate",
          controller: item.rate,
          onChanged: (_) => calculationController.calculateItem(item),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 30),
        MyTextField(
          hintText: "GST",
          controller: item.gst,
          readOnly: true,
          iconButton: IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () => _showGstDialog(context, item),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 30),
        MyTextField(
          hintText: "Tax",
          controller: item.tax,
          readOnly: true,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 30),
        MyTextField(
          hintText: "Total",
          controller: item.total,
          readOnly: true,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (addItemController.items.length > 1)
              TextButton(
                onPressed: () => addItemController.removeItem(index),
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
                Get.snackbar(
                  "Success",
                  // ignore: unnecessary_null_comparison
                  "Item ${index != null ? 'updated' : 'created'} successfully",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green.shade100,
                  colorText: Colors.black,
                );
              },
              child: Text(
                // ignore: unnecessary_null_comparison
                index != null ? "Update" : "Create",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 40),
      ],
    );
  }
}
