// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// class AddItemController extends GetxController {
//   // Client details
//   final clientName = TextEditingController();
//   final contactNumber = TextEditingController();
//   final clientAddress = TextEditingController();

//   // Invoice info
//   final invoiceNumber = TextEditingController();
//   final invoiceDate = TextEditingController();
//   final dueDate = TextEditingController();
//   final subtotal = TextEditingController();
//   final notes = TextEditingController();

//   // Add products controller
//   var productList = <Product>[].obs;

//   final productName = TextEditingController();
//   final brandName = TextEditingController();
//   final productPrice = TextEditingController();
//   final productQuntity = TextEditingController();
//   final sizeVariant = TextEditingController();
//   final productDescription = TextEditingController();
//   final customCode = TextEditingController();

//   var barcode = "".obs;

//   // In AddItemController
//   Product createProduct() {
//     final name = productName.text.trim();
//     final brand = brandName.text.trim();
//     final price = double.tryParse(productPrice.text.trim()) ?? 0.00;
//     final quantity = int.tryParse(productQuntity.text.trim()) ?? 0;
//     final size = int.tryParse(sizeVariant.text.trim()) ?? 0;
//     final description = productDescription.text.trim();
//     final code = customCode.text.trim();
//     final barcodeValue = barcode.value;

//     return Product(
//       name,
//       brand,
//       price,
//       quantity,
//       size,
//       description,
//       code,
//       barcodeValue,
//     );
//   }

//   void saveProduct() {
//     final product = createProduct();
//     productList.add(product);

//     productName.clear();
//     brandName.clear();
//     productPrice.clear();
//     productQuntity.clear();
//     sizeVariant.clear();
//     productDescription.clear();
//     customCode.clear();
//     barcode.value = "";
//   }

//   String generateBarcode() {
//     final product = createProduct(); // Creates a product but doesn't save it
//     return "${product.productName}-${product.brand}-${product.price.toStringAsFixed(2)}";
//   }

//   // List of items
//   final items = <Item>[].obs;
//   final savedInvoices = <Invoice>[].obs;
//   final isReadOnly = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     createItem();
//   }

//   @override
//   void onClose() {
//     _disposeControllers([
//       clientName,
//       contactNumber,
//       clientAddress,
//       invoiceNumber,
//       invoiceDate,
//       dueDate,
//       subtotal,
//       notes,
//     ]);

//     for (var item in items) {
//       item.dispose();
//     }

//     super.onClose();
//   }

//   void _disposeControllers(List<TextEditingController> controllers) {
//     for (var controller in controllers) {
//       controller.dispose();
//     }
//   }

//   void createItem() {
//     items.add(
//       Item(
//         name: TextEditingController(),
//         quantity: TextEditingController(),
//         rate: TextEditingController(),
//         gst: TextEditingController(),
//         tax: TextEditingController(),
//         total: TextEditingController(),
//       ),
//     );
//   }

//   void calculateItem(Item item) {
//     final quantity = int.tryParse(item.quantity.text) ?? 0;
//     final rate = double.tryParse(item.rate.text) ?? 0.0;
//     final gst = double.tryParse(item.gst.text.replaceAll('%', '')) ?? 0.0;

//     final baseAmount = quantity * rate;
//     final tax = (baseAmount * gst) / 100;
//     final total = baseAmount + tax;

//     item.tax.text = tax.toStringAsFixed(2);
//     item.total.text = total.toStringAsFixed(2);

//     items.refresh();
//   }

//   double get_Gst(InvoiceDetails id) {
//     return (id.total - id.subTotal);
//   }

//   void removeItem(int index) {
//     if (items.length > 1) {
//       items[index].dispose();
//       items.removeAt(index);
//     }
//   }

//   void toggleReadOnly() {
//     isReadOnly.toggle();
//   }

//   Future<String?> pickDate(BuildContext context) async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     return pickedDate != null
//         ? DateFormat('dd/MM/yyyy').format(pickedDate)
//         : null;
//   }

//   void saveInvoice() {
//     final invoice = Invoice(
//       details: InvoiceDetails(
//         name: clientName.text,
//         number: contactNumber.text,
//         address: clientAddress.text,
//         invoiceNumber: invoiceNumber.text,
//         invoiceDate: invoiceDate.text,
//         dueDate: dueDate.text,
//         notes.text,
//         subTotal: double.tryParse(subtotal.text) ?? 0.0,
//         total: calculateTotal(),
//       ),
//       items: List<Item>.from(items.map((item) => Item.copy(item))),
//     );

//     savedInvoices.add(invoice);
//     clientName.clear();
//     contactNumber.clear();
//     clientAddress.clear();
//     invoiceNumber.clear();
//     invoiceDate.clear();
//     dueDate.clear();
//     items.clear();
//   }

//   double calculateTotal() {
//     return items.fold(0.0, (sum, item) {
//       return sum + (double.tryParse(item.total.text) ?? 0.0);
//     });
//   }
// }

// class Item {
//   final TextEditingController name;
//   final TextEditingController quantity;
//   final TextEditingController rate;
//   final TextEditingController gst;
//   final TextEditingController tax;
//   final TextEditingController total;

//   Item({
//     required this.name,
//     required this.quantity,
//     required this.rate,
//     required this.gst,
//     required this.tax,
//     required this.total,
//   });

//   factory Item.copy(Item other) {
//     return Item(
//       name: TextEditingController(text: other.name.text),
//       quantity: TextEditingController(text: other.quantity.text),
//       rate: TextEditingController(text: other.rate.text),
//       gst: TextEditingController(text: other.gst.text),
//       tax: TextEditingController(text: other.tax.text),
//       total: TextEditingController(text: other.total.text),
//     );
//   }

//   void dispose() {
//     name.dispose();
//     quantity.dispose();
//     rate.dispose();
//     gst.dispose();
//     tax.dispose();
//     total.dispose();
//   }

//   @override
//   String toString() {
//     return 'Item(name: \${name.text}, quantity: \${quantity.text}, rate: \${rate.text}, gst: \${gst.text}, tax: \${tax.text}, total: \${total.text})';
//   }
// }

// class Invoice {
//   final InvoiceDetails details;
//   final List<Item> items;

//   Invoice({required this.details, required this.items});
// }

// class InvoiceDetails {
//   final String name;
//   final String number;
//   final String address;
//   final String invoiceNumber;
//   final String invoiceDate;
//   final String dueDate;
//   final double subTotal;
//   final double total;
//   final String notes;

//   InvoiceDetails(
//     this.notes, {
//     required this.name,
//     required this.number,
//     required this.address,
//     required this.invoiceNumber,
//     required this.invoiceDate,
//     required this.dueDate,
//     required this.subTotal,
//     required this.total,
//   });

//   @override
//   String toString() {
//     return 'InvoiceDetails(name: \$name, number: \$number, address: \$address, invoiceNumber: \$invoiceNumber, invoiceDate: \$invoiceDate, dueDate: \$dueDate, total: \$total)';
//   }
// }

// class Product {
//   final String productName;
//   final String brand;
//   final double price;
//   final int quantity;
//   final int size;
//   final String description;
//   final String customCode;
//   final String barcode;

//   Product(
//     this.productName,
//     this.brand,
//     this.price,
//     this.quantity,
//     this.size,
//     this.description,
//     this.customCode,
//     this.barcode,
//   );
// }

import 'package:anubs_invoice_app/controller/barcode_controller.dart';
import 'package:anubs_invoice_app/controller/calculation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddItemController extends GetxController {
  // Client details
  final clientName = TextEditingController();
  final contactNumber = TextEditingController();
  final clientAddress = TextEditingController();

  // Invoice info
  final invoiceNumber = TextEditingController();
  final invoiceDate = TextEditingController();
  final dueDate = TextEditingController();
  final subtotal = TextEditingController();
  final notes = TextEditingController();

  // Add products controller
  var productList = <Product>[].obs;

  final productName = TextEditingController();
  final brandName = TextEditingController();
  final productPrice = TextEditingController();
  final productQuntity = TextEditingController();
  final sizeVariant = TextEditingController();
  final productDescription = TextEditingController();
  final customCode = TextEditingController();

  var barcode = "".obs;

  // List of items
  final items = <Item>[].obs;
  final savedInvoices = <Invoice>[].obs;
  final isReadOnly = false.obs;


  Product createProduct() {
    return Product(
      productName.text.trim(),
      brandName.text.trim(),
      double.tryParse(productPrice.text.trim()) ?? 0.00,
      int.tryParse(productQuntity.text.trim()) ?? 0,
      int.tryParse(sizeVariant.text.trim()) ?? 0,
      productDescription.text.trim(),
      customCode.text.trim(),
      Get.find<BarcodeController>().barcode.value,
    );
  }

  void saveProduct() {
    final product = createProduct();
    productList.add(product);
    clearProductFields();
    Get.find<BarcodeController>().clearBarcode();
  }

  void clearProductFields() {
    productName.clear();
    brandName.clear();
    productPrice.clear();
    productQuntity.clear();
    sizeVariant.clear();
    productDescription.clear();
    customCode.clear();
  }

  @override
  void onInit() {
    super.onInit();
    createItem();
  }

  @override
  void onClose() {
    _disposeControllers([
      clientName,
      contactNumber,
      clientAddress,
      invoiceNumber,
      invoiceDate,
      dueDate,
      subtotal,
      notes,
    ]);

    for (var item in items) {
      item.dispose();
    }

    super.onClose();
  }

  void _disposeControllers(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.dispose();
    }
  }

  void createItem() {
    items.add(
      Item(
        name: TextEditingController(),
        quantity: TextEditingController(),
        rate: TextEditingController(),
        gst: TextEditingController(),
        tax: TextEditingController(),
        total: TextEditingController(),
      ),
    );
  }

  void removeItem(int index) {
    if (items.length > 1) {
      items[index].dispose();
      items.removeAt(index);
    }
  }

  void toggleReadOnly() {
    isReadOnly.toggle();
  }

  Future<String?> pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    return pickedDate != null
        ? DateFormat('dd/MM/yyyy').format(pickedDate)
        : null;
  }

  void saveInvoice() {
    final invoice = Invoice(
      details: InvoiceDetails(
        name: clientName.text,
        number: contactNumber.text,
        address: clientAddress.text,
        invoiceNumber: invoiceNumber.text,
        invoiceDate: invoiceDate.text,
        dueDate: dueDate.text,
        notes.text,
        subTotal: double.tryParse(subtotal.text) ?? 0.0,
        total: Get.find<CalculationController>().calculateInvoiceTotal(items),
      ),
      items: List<Item>.from(items.map((item) => Item.copy(item))),
    );

    savedInvoices.add(invoice);
    clientName.clear();
    contactNumber.clear();
    clientAddress.clear();
    invoiceNumber.clear();
    invoiceDate.clear();
    dueDate.clear();
    items.clear();
  }
}

class Invoice {
  final InvoiceDetails details;
  final List<Item> items;

  Invoice({required this.details, required this.items});
}

class InvoiceDetails {
  final String name;
  final String number;
  final String address;
  final String invoiceNumber;
  final String invoiceDate;
  final String dueDate;
  final double subTotal;
  final double total;
  final String notes;

  InvoiceDetails(
    this.notes, {
    required this.name,
    required this.number,
    required this.address,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.dueDate,
    required this.subTotal,
    required this.total,
  });
}

class Product {
  final String productName;
  final String brand;
  final double price;
  final int quantity;
  final int size;
  final String description;
  final String customCode;
  final String barcode;

  Product(
    this.productName,
    this.brand,
    this.price,
    this.quantity,
    this.size,
    this.description,
    this.customCode,
    this.barcode,
  );
}
