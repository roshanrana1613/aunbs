import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:get/get.dart';

class InvocieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceController>(() => InvoiceController());
  }
}
