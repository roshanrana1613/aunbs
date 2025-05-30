// import 'package:anubs_invoice_app/add_item_responsive/mobile_add_item_page.dart';
// import 'package:anubs_invoice_app/controller/add_item_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ItemListScreen extends StatelessWidget {
//   ItemListScreen({super.key});
//   final addItemController = Get.find<AddItemController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Invoice Items")),
//       body: Obx(() {
//         if (addItemController.item.isEmpty) {
//           return const Center(child: Text("No items added."));
//         }

//         final itemCount = [
//           addItemController.item.length,
//           addItemController.itemnameController.length,
//           addItemController.qtyController.length,
//           addItemController.rateController.length,
//           addItemController.gstControllers.length,
//           addItemController.taxController.length,
//           addItemController.totalController.length,
//         ].reduce((a, b) => a < b ? a : b);

//         return ListView.builder(
//           itemCount: itemCount,
//           itemBuilder: (context, index) {
//             return Card(
//               margin: const EdgeInsets.all(10),
//               child: ListTile(
//                 title: Text(
//                   addItemController.item[index],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Qty: ${addItemController.qtyController[index].text}"),
//                     Text(
//                       "Rate: ${addItemController.rateController[index].text}",
//                     ),
//                     Text(
//                       "GST: ${addItemController.gstControllers[index].text}",
//                     ),
//                     Text("Tax: ${addItemController.taxController[index].text}"),
//                     Text(
//                       "Total: ${addItemController.totalController[index].text}",
//                     ),
//                   ],
//                 ),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder:
//                           (_) => AlertDialog(
//                             title: const Text("Confirm Delete"),
//                             content: const Text(
//                               "Are you sure you want to delete this item?",
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.of(context).pop(),
//                                 child: const Text("Cancel"),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   addItemController.deleteItem(index);
//                                   Navigator.of(context).pop();
//                                   Get.snackbar(
//                                     "Deleted",
//                                     "Item deleted successfully",
//                                     snackPosition: SnackPosition.BOTTOM,
//                                   );
//                                 },
//                                 child: const Text(
//                                   "Delete",
//                                   style: TextStyle(color: Colors.red),
//                                 ),
//                               ),
//                             ],
//                           ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           }
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => MobileAddItemPage());
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
