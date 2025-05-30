import 'package:anubs_invoice_app/controller/page_controller.dart';
import 'package:get/get.dart';

class PageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() => MyPageController());
  }
}
