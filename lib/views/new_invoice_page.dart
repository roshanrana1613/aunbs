// import 'package:anubs_invoice_app/controller/add_item_controller.dart';
// import 'package:anubs_invoice_app/controller/date_controller.dart';
// import 'package:anubs_invoice_app/utiles/client_details.dart';
// import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NewInvoicePage extends StatelessWidget {
//   NewInvoicePage({super.key});
//   final controller = Get.find<DateController>();
//   // final addItemController = Get.find<AddItemController>();
//   final List<String> gstPercentages = ['5%', '12%', '18%', '28%'];

//   //calculation controller........

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: FocusScope.of(context).unfocus,
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight),

//           child: MyAppBar(
//             title: "Create New Invoice",
//             action: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(
//               left: 15,
//               right: 15,
//               top: 35,
//               bottom: 30,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(Icons.save, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             "Save Invoice",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     SizedBox(
//                       width: 120,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           padding: EdgeInsets.zero,
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(color: Colors.black, width: 0.4),
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.save, color: Colors.black),
//                             SizedBox(width: 8),
//                             Text(
//                               "Print/View",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green.shade400,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                         elevation: 0,
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(Icons.send, color: Colors.white),
//                           SizedBox(width: 8),
//                           Text(
//                             "Send WhatsApp",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,

//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withAlpha(35),
//                         blurRadius: 10,
//                         spreadRadius: 4,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 30,
//                       right: 30,
//                       bottom: 30,
//                       top: 30,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Client Details",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: 'Client Name',
//                           hintText: 'Full Name',
//                           icon: null,
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: 'Contact Number',
//                           hintText: '+91 XXXXXXXXXX',
//                           icon: null,
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: 'Client Address',
//                           hintText: 'Full Address',
//                           maxLines: 3,
//                           icon: null,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,

//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withAlpha(35),
//                         blurRadius: 10,
//                         spreadRadius: 4,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 30,
//                       right: 30,
//                       bottom: 30,
//                       top: 30,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Invoice Information",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: 'Invoice Number',
//                           hintText: 'Auto-genrated or Manual',
//                           icon: null,
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: 'Invoice Date',
//                           hintText: controller.dateController.text,
//                           icon: null,
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: 'Due Date (Optional)',
//                           hintText: 'dd/mm/yyyyy',
//                           icon: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.calendar_month),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,

//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withAlpha(35),
//                         blurRadius: 10,
//                         spreadRadius: 4,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Items",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         SizedBox(height: 30),

//                         // Add Item Button
//                         SizedBox(
//                           width: 120,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               addItemController.addItem(
//                                 "Item ${addItemController.item.length + 1}",
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               padding: EdgeInsets.zero,
//                               shape: RoundedRectangleBorder(
//                                 side: BorderSide(
//                                   color: Colors.black,
//                                   width: 0.4,
//                                 ),
//                                 borderRadius: BorderRadius.circular(7),
//                               ),
//                               elevation: 0,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.add_circle_outline,
//                                   color: Colors.black,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   "Add Item",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),

//                         SizedBox(height: 30),

//                         // Scrollable Header + Data Together
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Header Row
//                               Row(
//                                 children: const [
//                                   SizedBox(
//                                     width: 240,
//                                     child: Text("Description"),
//                                   ),
//                                   SizedBox(width: 75, child: Text("Qty")),
//                                   SizedBox(width: 90, child: Text("Rate (₹)")),
//                                   SizedBox(width: 120, child: Text("GST (%)")),
//                                   SizedBox(width: 110, child: Text("Tax (₹)")),
//                                   SizedBox(width: 80, child: Text("Total (₹)")),
//                                 ],
//                               ),
//                               SizedBox(height: 10),

//                               // Data Rows (scroll with header)
//                               Obx(
//                                 () => Column(
//                                   children: List.generate(addItemController.item.length, (
//                                     index,
//                                   ) {
//                                     return Row(
//                                       children: [
//                                         // Item Name or HSN
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 205,
//                                             child: ClientDetails(
//                                               labelName: "",
//                                               hintText: "Item name or HSN code",
//                                               maxLines: 1,
//                                               icon: null,
//                                               textAlign: TextAlign.start,
//                                               controller:
//                                                   addItemController
//                                                       .itemnameController[index],
//                                             ),
//                                           ),
//                                         ),

//                                         // Quantity
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                             left: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 70,
//                                             child: ClientDetails(
//                                               labelName: "",
//                                               hintText: "Qty",
//                                               maxLines: 1,
//                                               icon: null,
//                                               textAlign: TextAlign.center,
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               controller:
//                                                   addItemController
//                                                       .qtyController[index],
//                                               onChanged:
//                                                   (p0) => addItemController
//                                                       .calculateTotal(index),
//                                             ),
//                                           ),
//                                         ),

//                                         // Rate
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                             left: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 70,
//                                             child: ClientDetails(
//                                               labelName: "",
//                                               hintText: "Rate",
//                                               maxLines: 1,
//                                               icon: null,
//                                               textAlign: TextAlign.center,
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               controller:
//                                                   addItemController
//                                                       .rateController[index],
//                                               onChanged:
//                                                   (p0) => addItemController
//                                                       .calculateTotal(index),
//                                             ),
//                                           ),
//                                         ),

//                                         // GST Dropdown
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                             left: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 100,
//                                             child: ClientDetails(
//                                               labelName: "",
//                                               hintText: "GST",
//                                               maxLines: 1,
//                                               readonly: true,
//                                               controller:
//                                                   addItemController
//                                                       .gstControllers[index],
//                                               onChanged:
//                                                   (p0) => addItemController
//                                                       .calculateTotal(index),
//                                               icon: IconButton(
//                                                 onPressed: () {
//                                                   showDialog(
//                                                     context: context,
//                                                     builder: (context) {
//                                                       return AlertDialog(
//                                                         title: const Text(
//                                                           "Select GST",
//                                                         ),
//                                                         content: SizedBox(
//                                                           height:
//                                                               300, // Fixed height to avoid unbounded height
//                                                           width: 200,
//                                                           child: ListView.builder(
//                                                             itemCount:
//                                                                 gstPercentages
//                                                                     .length,
//                                                             itemBuilder: (
//                                                               context,
//                                                               i,
//                                                             ) {
//                                                               final gst =
//                                                                   gstPercentages[i];
//                                                               return ListTile(
//                                                                 title: Text(
//                                                                   gst,
//                                                                 ),
//                                                                 onTap: () {
//                                                                   addItemController
//                                                                       .gstControllers[index]
//                                                                       .text = gst;
//                                                                   Navigator.pop(
//                                                                     context,
//                                                                   );
//                                                                   FocusScope.of(
//                                                                     context,
//                                                                   ).unfocus();
//                                                                 },
//                                                               );
//                                                             },
//                                                           ),
//                                                         ),
//                                                       );
//                                                     },
//                                                   );
//                                                 },
//                                                 icon: const Icon(
//                                                   Icons.arrow_drop_down,
//                                                 ),
//                                               ),
//                                               textAlign: TextAlign.start,
//                                             ),
//                                           ),
//                                         ),

//                                         // Tax (readonly)
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                             left: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 100,
//                                             child: ClientDetails(
//                                               labelName: "",
//                                               hintText: "",
//                                               maxLines: 1,
//                                               readonly: true,
//                                               icon: null,
//                                               textAlign: TextAlign.center,
//                                               controller:
//                                                   addItemController
//                                                       .taxController[index],
//                                               onChanged:
//                                                   (p0) => addItemController
//                                                       .calculateTotal(index),
//                                             ),
//                                           ),
//                                         ),

//                                         // Total (readonly)
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                             left: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 100,
//                                             child: ClientDetails(
//                                               labelName: "",
//                                               hintText: "",
//                                               maxLines: 1,
//                                               readonly: true,
//                                               icon: null,
//                                               textAlign: TextAlign.center,
//                                               textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20,
//                                               ),
//                                               controller:
//                                                   addItemController
//                                                       .totalController[index],
//                                               onChanged:
//                                                   (p0) => addItemController
//                                                       .calculateTotal(index),
//                                             ),
//                                           ),
//                                         ),

//                                         // Delete button
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             bottom: 12,
//                                             left: 12,
//                                           ),
//                                           child: SizedBox(
//                                             width: 50,
//                                             child: IconButton(
//                                               onPressed: () {
//                                                 addItemController.removeItem(
//                                                   index,
//                                                 );
//                                               },
//                                               icon: const Icon(
//                                                 Icons.delete,
//                                                 color: Colors.red,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         SizedBox(height: 30),
//                       ],
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 30),
//                 Container(
//                   width: double.infinity,

//                   // height: 250,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withAlpha(35),
//                         blurRadius: 10,
//                         spreadRadius: 4,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Notes / Terms & Conditions",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15,
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         ClientDetails(
//                           labelName: "",
//                           hintText: "Thank you for your business!",
//                           icon: null,
//                           maxLines: 3,
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Subtotal:",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Total:",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 color: Colors.deepOrangeAccent.shade200,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
