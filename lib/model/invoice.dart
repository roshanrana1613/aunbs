class Invoice {
  bool? success;
  String? message;
  List<InvoiceData>? data;

  Invoice({this.success, this.message, this.data});

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      success: json['success'],
      message: json['message'],
      data:
          json['data'] != null
              ? (json['data'] as List)
                  .map((v) => InvoiceData.fromJson(v))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
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
  List<Items>? items;
  double? subtotal;
  double? totalGST;
  double? grandTotal;
  int? iV;

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
    this.iV,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return InvoiceData(
      sId: json['_id'],
      clientName: json['clientName'],
      invoiceNumber: json['invoiceNumber'],
      contactNumber: json['contactNumber']?.toInt(),
      clientAddress: json['clientAddress'],
      invoiceDate: json['invoiceDate'],
      dueDate: json['dueDate'],
      items:
          json['items'] != null
              ? (json['items'] as List).map((v) => Items.fromJson(v)).toList()
              : null,
      subtotal: _toDouble(json['subtotal']),
      totalGST: _toDouble(json['totalGST']),
      grandTotal: _toDouble(json['grandTotal']),
      iV: json['__v']?.toInt(),
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
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
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = subtotal;
    data['totalGST'] = totalGST;
    data['grandTotal'] = grandTotal;
    data['__v'] = iV;
    return data;
  }
}

class Items {
  String? description;
  int? quantity;
  double? rate;
  double? gST;
  double? tax;
  double? total;
  String? sId;

  Items({
    this.description,
    this.quantity,
    this.rate,
    this.gST,
    this.tax,
    this.total,
    this.sId,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      description: json['description'],
      quantity: json['quantity']?.toInt(),
      rate: _toDouble(json['Rate']),
      gST: _toDouble(json['GST']),
      tax: _toDouble(json['Tax']),
      total: _toDouble(json['Total']),
      sId: json['_id'],
    );
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['quantity'] = quantity;
    data['Rate'] = rate;
    data['GST'] = gST;
    data['Tax'] = tax;
    data['Total'] = total;
    data['_id'] = sId;
    return data;
  }
}
