import 'package:anubs_invoice_app/model/invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';

class InvoiceController extends GetxController {
  var invoiceList = <InvoiceData>[].obs;
  var isLoading = true.obs;
  final apiService = ApiService();

  

  @override
  void onInit() {
    fetchInvoices();
    super.onInit();
  }

  Future<void> fetchInvoices() async {
    try {
      isLoading(true);
      final data = await apiService.fetchInvoice();
      invoiceList.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch invoice list");
      invoiceList.clear();
    } finally {
      isLoading(false);
    }
  }

  Future<void> createInvoice(InvoiceData invoiceData) async {
    try {
      isLoading(true);
      await apiService.postInvoice(invoiceData);
      await fetchInvoices(); // Refresh the list after creation
      Get.back();
    } catch (e) {
      Get.snackbar("Error", "Failed to send Invoice");
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteData(InvoiceData invoiceData) async {
    try {
      isLoading(true);
      await apiService.deleteInvoice(invoiceData.sId.toString());
      await fetchInvoices(); // refresh list
      Get.snackbar(
        "Deleted",
        "Invoice deleted successfully",
        backgroundColor: Colors.red.withAlpha(125),
        colorText: Colors.white,
      );
    } catch (e) {
      print("Error in deleteData: $e");
      Get.snackbar("Error", "Failed to delete invoice");
    } finally {
      isLoading(false);
    }
  }
}
