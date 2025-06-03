import 'dart:convert';

import 'package:anubs_invoice_app/model/invoice.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://aunbs.onrender.com/api/v1/invoice";
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
}
