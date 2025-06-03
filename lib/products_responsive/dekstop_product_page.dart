import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_item_controller.dart';
import '../utiles/card_list.dart';

class DekstopProductPage extends StatelessWidget {
  DekstopProductPage({super.key});
  final addItemController = Get.find<AddItemController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: const Text(
                      "Products",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 300, // 👈 Set your desired width
                    child: MySearchField(
                      hintText: "Search products...",
                      controller: null,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 45,
                    child: MyAddItemButton(
                      label: "Add Product",
                      icon: Icons.add_circle_outline,
                      onPressed: () {
                        Get.offNamed(Routes.addProduct);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: addItemController.productList.length,
                  itemBuilder: (context, index) {
                    final product = addItemController.productList[index];
                    return CardList(index: index, product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
