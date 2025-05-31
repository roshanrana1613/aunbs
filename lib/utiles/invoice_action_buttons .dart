import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:anubs_invoice_app/model/invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/add_item_controller.dart';
import '../routes/app_pages.dart'; // Update this import if needed

class InvoiceActionButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AddItemController addItemController;

  InvoiceActionButtons({
    super.key,
    required this.formKey,
    required this.addItemController,
  });
  final invoiceController = Get.find<InvoiceController>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 400;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:
          isSmallScreen
              ? Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: _buildButtons(context),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    _buildButtons(
                      context,
                    ).map((button) => Expanded(child: button)).toList(),
              ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    return [
      _buildSquareButton(
        context,
        labelTop: "Save",
        labelBottom: "Invoice",
        icon: Icons.save,
        onTap: () {
          if (formKey.currentState!.validate()) {
            final invoiceDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
            final dueDate = DateFormat(
              'yyyy-MM-dd',
            ).format(DateTime.now().add(Duration(days: 7)));
            final invoiceData = InvoiceData(
              clientName: addItemController.clientName.text,
              contactNumber: int.tryParse(addItemController.contactNumber.text),
              clientAddress: addItemController.clientAddress.text,
              invoiceNumber: addItemController.invoiceNumber.text,
              invoiceDate: invoiceDate,
              dueDate: dueDate,
              subtotal: double.tryParse(addItemController.subtotal.text),
              // only gst count is empty that can fix letter
              totalGST: double.tryParse(addItemController.subtotal.text),
              // here can adding total can fix letter
              grandTotal: double.tryParse(addItemController.subtotal.text),
            );

            print("withot cast -> ${addItemController.subtotal.text}");

            print(
              "With cat -> ${int.tryParse(addItemController.subtotal.text)}",
            );

            invoiceController.createInvoice(invoiceData);
            Get.offNamed(Routes.invoicesList);
            Get.snackbar("Success", "Invoice Saved");
          }
        },
      ),
      _buildSquareButton(
        context,
        labelTop: "Print",
        labelBottom: "View",
        icon: Icons.print,
        onTap: () {},
        border: const BorderSide(color: Colors.black54, width: 0.5),
      ),
      _buildSquareButton(
        context,
        labelTop: "Send",
        labelBottom: "WhatsApp",
        icon: Icons.send,
        onTap: () {},
      ),
    ];
  }

  Widget _buildSquareButton(
    BuildContext context, {
    required String labelTop,
    required String labelBottom,
    required IconData icon,
    required VoidCallback onTap,
    BorderSide? border,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        height: 100,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: border ?? BorderSide.none,
            ),
            elevation: 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 26,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 6),
              Text(
                labelTop,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                labelBottom,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
