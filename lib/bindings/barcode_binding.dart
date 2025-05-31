import 'package:anubs_invoice_app/controller/barcode_controller.dart';
import 'package:get/get.dart';

class BarcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarcodeController>(() => BarcodeController());
  }
}
