import 'package:flutter/material.dart';

class Invoice {
  List<InvoiceData>? data;

  Invoice({this.data});

  Invoice.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <InvoiceData>[];
      json['data'].forEach((v) {
        data!.add(InvoiceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceData {
  String? sId;
  String? clientName;
  String? invoiceNumber;
  int? contactNumber;
  String? clientAddress;
  String? invoiceDate;
  String? dueDate;
  List<Item>? items;
  double? subtotal;
  double? totalGST;
  double? grandTotal;

  InvoiceData({
    this.sId,
    this.clientName,
    this.invoiceNumber,
    this.contactNumber,
    this.clientAddress,
    this.invoiceDate,
    this.dueDate,
    this.items,
    this.subtotal,
    this.totalGST,
    this.grandTotal,
  });

  InvoiceData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clientName = json['clientName'];
    invoiceNumber = json['invoiceNumber'];
    contactNumber = (json['contactNumber'] as num?)?.toInt();
    clientAddress = json['clientAddress'];
    invoiceDate = json['invoiceDate'];
    dueDate = json['dueDate'];
    subtotal = (json['subtotal'] as num?)?.toDouble();
    totalGST = (json['totalGST'] as num?)?.toDouble();
    grandTotal = (json['grandTotal'] as num?)?.toDouble();

    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['clientName'] = clientName;
    data['invoiceNumber'] = invoiceNumber;
    data['contactNumber'] = contactNumber;
    data['clientAddress'] = clientAddress;
    data['invoiceDate'] = invoiceDate;
    data['dueDate'] = dueDate;
    data['subtotal'] = subtotal;
    data['totalGST'] = totalGST;
    data['grandTotal'] = grandTotal;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  final TextEditingController description;
  final TextEditingController quantity;
  final TextEditingController rate;
  final TextEditingController gst;
  final TextEditingController tax;
  final TextEditingController total;
  final String? sId;

  Item({
    String? description,
    int? quantity,
    double? rate,
    double? gst,
    double? tax,
    double? total,
    this.sId,
  }) : description = TextEditingController(text: description),
       quantity = TextEditingController(text: quantity?.toString()),
       rate = TextEditingController(text: rate?.toString()),
       gst = TextEditingController(text: gst?.toString()),
       tax = TextEditingController(text: tax?.toString()),
       total = TextEditingController(text: total?.toString());

  // Don't forget to dispose controllers when no longer needed to prevent memory leaks
  void dispose() {
    description.dispose();
    quantity.dispose();
    rate.dispose();
    gst.dispose();
    tax.dispose();
    total.dispose();
  }

  // Convert to JSON by reading controller text
  Map<String, dynamic> toJson() => {
    'description': description.text.trim(),
    'quantity': int.tryParse(quantity.text.trim()),
    'Rate': double.tryParse(rate.text.trim()),
    'GST': double.tryParse(gst.text),
    'Tax': double.tryParse(tax.text.trim()),
    'Total': double.tryParse(total.text.trim()),
    '_id': sId,
  };

  // Similarly, create from JSON if needed
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      description: json['description'],
      quantity: (json['quantity'] as num?)?.toInt(),
      rate: (json['Rate'] as num?)?.toDouble(),
      gst: (json['GST'] as num?)?.toDouble(),
      tax: (json['Tax'] as num?)?.toDouble(),
      total: (json['Total'] as num?)?.toDouble(),
      sId: json['_id'],
    );
  }
}
