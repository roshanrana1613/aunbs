import 'dart:convert';

import 'package:anubs_invoice_app/model/invoice.dart';
import 'package:anubs_invoice_app/model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://aunbs.onrender.com/api/v1/invoice";
  final baseUrlProduct = "https://aunbs.onrender.com/api/v1/product";

  Future<List<InvoiceData>> fetchInvoice() async {
    final url = Uri.parse("$baseUrl/get"); // Get Invoice...

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      final List<dynamic> invoiceData = jsonResponse['data'];

      return invoiceData
          .map((invoice) => InvoiceData.fromJson(invoice))
          .toList();
    } else {
      throw Exception("can't fetch invoices");
    }
  }

  Future<void> postInvoice(InvoiceData invoiceData) async {
    final url = Uri.parse("$baseUrl/post");
    final jsonBody = jsonEncode(invoiceData.toJson()); // Post Invocie...

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception("Failed to add invoice");
    }
  }

  Future<void> deleteInvoice(String id) async {
    final url = Uri.parse("$baseUrl/$id"); // DELETE endpoint with invoice ID

    final response = await http.delete(url);

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("Invoice deleted successfully");
    } else {
      throw Exception("Failed to delete invoice");
    }
  }

  // product api code

  Future<List<ProductData>> getProduct() async {
    final url = Uri.parse("$baseUrlProduct/get");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final productData = jsonDecode(response.body);
      final List<dynamic> productJson = productData["data"];
      final products =
          productJson.map((product) {
            return ProductData.fromJson(product); // ✅ return used!
          }).toList();
      print(response.statusCode);
      return products;
    } else {
      throw Exception("failed to get products");
    }
  }

  // product post api

  Future<void> postProduct(ProductData productData) async {
    final url = Uri.parse("$baseUrlProduct/post");
    final response = await http.post(
      url,
      body: jsonEncode(productData.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    print("post response code : ${response.statusCode}");

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception("Failed to post product");
    }
  }

  // product delete api
  Future<void> deleteProduct(String id) async {
    final url = Uri.parse("$baseUrlProduct/$id");
    print("DELETE URL: $url");

    final response = await http.delete(url);
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("Delete successfully");
    } else {
      throw Exception(
        "Error while deleting: ${response.statusCode}, ${response.body}",
      );
    }
  }
}
