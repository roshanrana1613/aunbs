import 'package:anubs_invoice_app/controller/calculation_controller.dart';
import 'package:anubs_invoice_app/controller/invoice_controller.dart';
import 'package:anubs_invoice_app/utiles/invoice_action_buttons%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/utiles/client_details.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';

import '../model/invoice.dart';

class DesktopInvoicePage extends StatelessWidget {
  DesktopInvoicePage({super.key});

  final addItemController = Get.find<AddItemController>();
  final _formKey = GlobalKey<FormState>();
  final List<String> gstPercentages = ['0', '5', '12', '18', '28'];
  final invoiceController = Get.find<InvoiceController>();
  final calculationController = Get.find<CalculationController>();

  final _clientName = FocusNode();
  final _contactClient = FocusNode();

  final _adressClient = FocusNode();

  final _invoiceNumber = FocusNode();
  final _invoiceDate = FocusNode();
  final _dueDate = FocusNode();
  final _itemName = FocusNode();
  final _itemQuntity = FocusNode();
  final _itemRate = FocusNode();
  final _itemGst = FocusNode();
  final _notes = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: MyAppBar(title: "Create New Invoice"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // Wrap client and invoice info cards in a Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // You can use Expanded or SizedBox with fixed width
                      Expanded(
                        child: SizedBox(
                          height: 400,
                          child: _buildClientDetailsCard(context),
                        ),
                      ),
                      const SizedBox(width: 30), // spacing between the cards
                      Expanded(
                        child: SizedBox(
                          height: 400,
                          child: _buildInvoiceInfoCard(context),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  _buildItemsCard(context),
                  const SizedBox(height: 30),
                  _buildNotesAndTotalsCard(context),
                  const SizedBox(height: 30),
                  InvoiceActionButtons(
                    formKey: _formKey,
                    addItemController: addItemController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClientDetailsCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(35),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: FocusTraversalGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Client Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 30),
              ClientDetails(
                focusNode: _clientName,
                controller: addItemController.clientName,
                labelName: 'Client Name',
                hintText: 'Full Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Full name required!";
                  }
                  return null;
                },
                icon: null,
              ),
              const SizedBox(height: 30),
              ClientDetails(
                focusNode: _contactClient,
                controller: addItemController.contactNumber,
                keyboardType: TextInputType.phone,
                labelName: 'Contact Number',
                hintText: '+91 XXXXXXXXXX',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Contact number required!";
                  }
                  if (value.length != 10) {
                    return "Enter a valid 10-digit number!";
                  }
                  return null;
                },
                icon: null,
              ),
              const SizedBox(height: 30),
              ClientDetails(
                focusNode: _adressClient,
                controller: addItemController.clientAddress,
                labelName: 'Client Address',
                hintText: 'Full Address',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Address is required!";
                  }
                  return null;
                },
                icon: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInvoiceInfoCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(35),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Invoice Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30),
            ClientDetails(
              focusNode: _invoiceNumber,
              keyboardType: TextInputType.number,
              controller: addItemController.invoiceNumber,
              labelName: 'Invoice Number',
              hintText: 'Auto-generated or Manual',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invoice number is required!";
                }
                return null;
              },
              icon: null,
            ),
            const SizedBox(height: 30),
            ClientDetails(
              focusNode: _invoiceDate,
              keyboardType: TextInputType.number,
              controller: addItemController.invoiceDate,
              labelName: 'Invoice Date',
              hintText: 'dd/mm/yyyy',
              icon: IconButton(
                onPressed: () async {
                  _pickDate(addItemController.invoiceDate);

                  // final date = await addItemController.pickDate(context);
                  // if (date != null) {
                  //   addItemController.invoiceDate.text = date;
                  // }
                },
                icon: const Icon(Icons.calendar_month),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invoice date is required!";
                }
                return null;
              },
            ),

            const SizedBox(height: 30),
            ClientDetails(
              focusNode: _dueDate,
              keyboardType: TextInputType.number,
              controller: addItemController.dueDate,
              labelName: 'Due Date (Optional)',
              hintText: 'dd/mm/yyyy',
              icon: IconButton(
                onPressed: () async {
                  _pickDate(addItemController.dueDate);
                  // final date = await addItemController.pickDate(context);
                  // if (date != null) {
                  //   addItemController.dueDate.text = date;
                  // }
                },
                icon: const Icon(Icons.calendar_month),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(35),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Items",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                MyAddItemButton(
                  label: "Add Item",
                  icon: Icons.add_circle_outline,
                  onPressed: () {
                    addItemController.createItem();
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: addItemController.items.length,
                itemBuilder: (context, index) {
                  final item = addItemController.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _buildItemRow(item, index, context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(Item item, int index, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(
              width: 230,
              child: ClientDetails(
                focusNode: _itemName,
                controller: item.description,
                textAlign: TextAlign.center,
                labelName: "Item Name",
                hintText: "Item name or HSN code",
                enable: !addItemController.isReadOnly.value,
                keyboardType: TextInputType.text,
                onChanged: (_) => calculateItem(item),
                icon: null,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                focusNode: _itemQuntity,
                controller: item.quantity,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "Quantity",
                hintText: " Qty",
                enable: !addItemController.isReadOnly.value,
                onChanged: (_) => calculateItem(item),
                icon: null,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                focusNode: _itemRate,
                controller: item.rate,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "Rate",
                hintText: " Rate",
                enable: !addItemController.isReadOnly.value,
                onChanged: (_) => calculateItem(item),
                icon: null,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                focusNode: _itemGst,
                controller: item.gst,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "Gst",
                hintText: "Gst",
                enable: !addItemController.isReadOnly.value,
                icon: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          title: const Text("Select GST %"),
                          content: SizedBox(
                            width: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: gstPercentages.length,
                              itemBuilder: (context, index) {
                                final gstValue = gstPercentages[index];
                                return ListTile(
                                  title: Text(gstValue),
                                  onTap: () {
                                    item.gst.text = gstValue;
                                    calculateItem(item);
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                controller: item.tax,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "",
                hintText: " Tax",
                enable: false,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                icon: null,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                controller: item.total,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "",
                hintText: " Total",
                enable: false,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                icon: null,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () => addItemController.removeItem(index),
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesAndTotalsCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(35),
            blurRadius: 10,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Notes / Terms & Conditions",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            const SizedBox(height: 30),
            ClientDetails(
              focusNode: _notes,
              labelName: "",
              hintText: "Thank you for your business!",
              maxLines: 3,
              controller: addItemController.notes,
              icon: null,
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final screenWidth = constraints.maxWidth < 380;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth ? 20 : 30,
                            color: Colors.grey,
                          ),
                        ),
                        Obx(() {
                          final subtotal = addItemController.items.fold<double>(
                            0.0,
                            (sum, item) {
                              final total =
                                  double.tryParse(item.total.text) ?? 0.0;
                              final tax = double.tryParse(item.tax.text) ?? 0.0;
                              return sum + (total - tax);
                            },
                          );

                          addItemController.subtotal.text = subtotal
                              .toStringAsFixed(2);

                          return Text(
                            "\u20B9 ${addItemController.subtotal.text}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth ? 20 : 30,
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth ? 20 : 30,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),

                        Obx(() {
                          final total = addItemController.items.fold<double>(
                            0.0,
                            (sum, item) =>
                                sum + (double.tryParse(item.total.text) ?? 0.0),
                          );
                          addItemController.total.text = total.toString();
                          return Text(
                            "\u20B9 ${total.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth ? 20 : 30,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void calculateItem(Item item) {
    final quantity = int.tryParse(item.quantity.text) ?? 0;
    final rate = double.tryParse(item.rate.text) ?? 0.0;
    final gst = double.tryParse(item.gst.text) ?? 0.0;

    final baseAmount = quantity * rate;
    final tax = (baseAmount * gst) / 100;
    final total = baseAmount + tax;

    item.tax.text = tax.toStringAsFixed(2);
    item.total.text = total.toStringAsFixed(2);

    addItemController.items.refresh();
  }

  void _pickDate(TextEditingController invoiceDateController) async {
    final date = await addItemController.pickDate(Get.context!);
    if (date != null) invoiceDateController.text = date;
  }
}
