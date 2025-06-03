import 'package:anubs_invoice_app/controller/barcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/invoice.dart';

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

  final total = TextEditingController();
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

  String formatDate(String date) {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd-MM-yyyy').format(dateTime);
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

  void clearInvoicePage() {
    clientName.clear();
    contactNumber.clear();
    clientAddress.clear();
    invoiceNumber.clear();
    invoiceDate.clear();
    dueDate.clear();
    items.clear();
    notes.clear();
    subtotal.clear();
    total.clear();
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
      total,
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
        description: "",
        quantity: 1,
        rate: 0,
        gst: 0,
        tax: 0.00,
        total: 0.00,
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
        totalItems: items.length,
        subTotal: double.tryParse(subtotal.text) ?? 0.0,
        total: double.tryParse(total.text) ?? 0.0,
      ),
      items: List<Item>.from(
        items.map((item) => Item.fromJson(item as Map<String, dynamic>)),
      ),
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
  final int totalItems;
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
    required this.totalItems,
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
