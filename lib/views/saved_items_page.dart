import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedItemsPage extends StatelessWidget {
  SavedItemsPage({super.key});
  final addItemController = Get.find<AddItemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Items", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Obx(() {
                if (addItemController.savedInvoices.isEmpty) {
                  return Center(child: Text("No items added yet"));
                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: addItemController.savedInvoices.length,
                  itemBuilder: (context, index) {
                    final item = addItemController.savedInvoices[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.details.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Get.to(
                                //   () => CalculationMobileField(
                                //     itemToEdit: item.details,
                                //     index: index,
                                //   ),
                                // );
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Text(
                                "Edit",
                                style: TextStyle(color: Colors.blue.shade800),
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: Text("Delete this item?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "Cancle",
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            print(index);
                                            addItemController.removeItem(index);
                                            Get.back();
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
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                        // subtitle: Text(
                        //   "Qty: ${item.quantity} \nRate: ${item.rate} \nGST: ${item.gst}"
                        //   "\nTax: ${item.tax} \nTotal: ${item.total}",
                        //   style: TextStyle(),
                        // ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
