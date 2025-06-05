class Product {
  List<ProductData>? data;

  Product({this.data});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
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

class ProductData {
  String? sId;
  String? productName;
  String? brand;
  int? price;
  int? quantity;
  String? size;
  String? description;
  String? customCode;
  String? barcode; // Add this line
  int? iV;

  ProductData({
    this.sId,
    this.productName,
    this.brand,
    this.price,
    this.quantity,
    this.size,
    this.description,
    this.customCode,
    this.barcode, // Add this line
    this.iV,
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['productName'];
    brand = json['brand'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
    description = json['description'];
    customCode = json['customCode'];
    barcode = json['barcode']; // Add this line
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['productName'] = productName;
    data['brand'] = brand;
    data['price'] = price;
    data['quantity'] = quantity;
    data['size'] = size;
    data['description'] = description;
    data['customCode'] = customCode;
    data['barcode'] = barcode; // Add this line
    data['__v'] = iV;
    return data;
  }
}
