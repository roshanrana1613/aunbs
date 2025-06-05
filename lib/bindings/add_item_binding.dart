import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/controller/calculation_controller.dart';
import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:anubs_invoice_app/controller/product_controller.dart';
import 'package:get/get.dart';

class AddItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddItemController>(() => AddItemController());
    Get.lazyPut<InvoiceController>(() => InvoiceController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<CalculationController>(() => CalculationController());
  }
}
