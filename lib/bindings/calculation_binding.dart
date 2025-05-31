import 'package:anubs_invoice_app/controller/calculation_controller.dart';
import 'package:get/get.dart';

class CalculationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculationController>(() => CalculationController());
  }
}
