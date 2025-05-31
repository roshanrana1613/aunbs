import 'package:get/get.dart';

class BarcodeController extends GetxController {
  var barcode = "".obs;

  String generateBarcode(String productName, String brand, double price) {
    final barcodeValue = "$productName-$brand-${price.toStringAsFixed(2)}";
    barcode.value = barcodeValue;
    return barcodeValue;
  }

  void clearBarcode() {
    barcode.value = "";
  }
}
