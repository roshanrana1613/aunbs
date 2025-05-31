import 'package:anubs_invoice_app/controller/calculation_controller.dart';
import 'package:anubs_invoice_app/utiles/invoice_action_buttons%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/utiles/client_details.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';

class DesktopInvoicePage extends StatelessWidget {
  DesktopInvoicePage({super.key});

  final addItemController = Get.find<AddItemController>();
  final _formKey = GlobalKey<FormState>();
  final List<String> gstPercentages = ['0%', '5%', '12%', '18%', '28%'];
  final calculationController = Get.find<CalculationController>();

  @override
  Widget build(BuildContext context) {
    final fromDrawer = Get.arguments?['fromDrawer'] ?? false;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: MyAppBar(
            leading:
                fromDrawer
                    ? null
                    : IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                    ),
            title: "Create New Invoice",
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  _buildTopSection(context),
                  const SizedBox(height: 30),
                  _buildItemsSection(context),
                  const SizedBox(height: 30),
                  _buildNotesAndTotalsSection(context),
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

  Widget _buildTopSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Client Details Container
        Expanded(
          child: SizedBox(
            height: 425,
            child: Container(
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
                child: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Client Details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 30),
                        ClientDetails(
                          controller: addItemController.clientName,
                          labelName: 'Client Name',
                          hintText: 'Full Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Full name required!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        ClientDetails(
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
                        ),
                        const SizedBox(height: 30),
                        ClientDetails(
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 30), // spacing between containers
        // Invoice Information Container
        Expanded(
          child: SizedBox(
            height: 425,
            child: Container(
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ClientDetails(
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
                    ),
                    const SizedBox(height: 30),
                    ClientDetails(
                      keyboardType: TextInputType.datetime,
                      controller: addItemController.invoiceDate,
                      labelName: 'Invoice Date',
                      hintText: 'dd/mm/yyyy',
                      icon: IconButton(
                        onPressed: () async {
                          final date = await addItemController.pickDate(
                            context,
                          );
                          if (date != null) {
                            addItemController.invoiceDate.text = date;
                          }
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
                      keyboardType: TextInputType.datetime,
                      controller: addItemController.dueDate,
                      labelName: 'Due Date (Optional)',
                      hintText: 'dd/mm/yyyy',
                      icon: IconButton(
                        onPressed: () async {
                          final date = await addItemController.pickDate(
                            context,
                          );
                          if (date != null) {
                            addItemController.dueDate.text = date;
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemsSection(BuildContext context) {
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
                  onPressed: () => addItemController.createItem(),
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
                controller: item.name,
                textAlign: TextAlign.center,
                labelName: "Item Name",
                hintText: "Item name or HSN code",
                enable: !addItemController.isReadOnly.value,
                keyboardType: TextInputType.text,
                onChanged: (_) => calculationController.calculateItem(item),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                controller: item.quantity,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "Quantity",
                hintText: " Qty",
                enable: !addItemController.isReadOnly.value,
                onChanged: (_) => calculationController.calculateItem(item),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                controller: item.rate,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "Rate",
                hintText: " Rate",
                enable: !addItemController.isReadOnly.value,
                onChanged: (_) => calculationController.calculateItem(item),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              child: ClientDetails(
                controller: item.gst,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                labelName: "Gst",
                hintText: "Gst",
                enable: !addItemController.isReadOnly.value,
                icon: IconButton(
                  onPressed: () => _showGstDialog(item, context),
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

  void _showGstDialog(Item item, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
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
                    Navigator.of(context).pop();
                    calculationController.calculateItem(item);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotesAndTotalsSection(BuildContext context) {
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
              labelName: "",
              hintText: "Thank you for your business!",
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.grey,
                  ),
                ),
                Obx(() {
                  final subtotal = addItemController.items.fold<double>(0.0, (
                    sum,
                    item,
                  ) {
                    final total = double.tryParse(item.total.text) ?? 0.0;
                    final tax = double.tryParse(item.tax.text) ?? 0.0;
                    return sum + (total - tax);
                  });
                  return Text(
                    "₹ ${subtotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
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
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Obx(() {
                  final total = addItemController.items.fold<double>(
                    0.0,
                    (sum, item) =>
                        sum + (double.tryParse(item.total.text) ?? 0.0),
                  );
                  return Text(
                    "₹ ${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
