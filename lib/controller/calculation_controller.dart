import 'package:get/get.dart';

import '../model/invoice.dart';

class CalculationController extends GetxController {
  // Calculate individual item totals
  void calculateItem(Item item) {
    final quantity = int.tryParse(item.quantity.toString()) ?? 0;
    final rate = double.tryParse(item.rate.toString()) ?? 0.0;
    final gst = double.tryParse(item.gst.toString().replaceAll('%', '')) ?? 0.0;

    final baseAmount = quantity * rate;
    final tax = (baseAmount * gst) / 100;
    final total = baseAmount + tax;

    item.tax.text = tax.toStringAsFixed(2);
    item.total.text = total.toStringAsFixed(2);
  }

  // Calculate GST amount
  double getGstAmount(double total, double subTotal) {
    return (total - subTotal);
  }

  // Calculate invoice total from all items
  double calculateInvoiceTotal(List<Item> items) {
    return items.fold(0.0, (sum, item) {
      return sum + (double.tryParse(item.total.toString()) ?? 0.0);
    });
  }

  // Calculate product total (price * quantity)
  double calculateProductTotal(double price, int quantity) {
    return price * quantity;
  }

  // Calculate tax amount for a product
  double calculateProductTax(double price, int quantity, double gstPercentage) {
    final subtotal = price * quantity;
    return (subtotal * gstPercentage) / 100;
  }
}

// class Item {
//   final TextEditingController name;
//   final TextEditingController quantity;
//   final TextEditingController rate;
//   final TextEditingController gst;
//   final TextEditingController tax;
//   final TextEditingController total;

//   Item({
//     required this.name,
//     required this.quantity,
//     required this.rate,
//     required this.gst,
//     required this.tax,
//     required this.total,
//   });

//   factory Item.copy(Item other) {
//     return Item(
//       name: TextEditingController(text: other.name.text),
//       quantity: TextEditingController(text: other.quantity.text),
//       rate: TextEditingController(text: other.rate.text),
//       gst: TextEditingController(text: other.gst.text),
//       tax: TextEditingController(text: other.tax.text),
//       total: TextEditingController(text: other.total.text),
//     );
//   }

//   void dispose() {
//     name.dispose();
//     quantity.dispose();
//     rate.dispose();
//     gst.dispose();
//     tax.dispose();
//     total.dispose();
//   }
// }
