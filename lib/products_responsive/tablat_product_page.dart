import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/controller/product_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utiles/card_list.dart';

class TablatProductPage extends StatelessWidget {
  TablatProductPage({super.key});
  final addItemController = Get.find<AddItemController>();
  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: MyAppBar(
          title: "Products",
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              FocusScope(
                node: FocusScopeNode(),
                child: MySearchField(
                  hintText: "Search Products...",
                  controller: null,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    final product = productController.productList[index];
                    return CardList(index: index, productData: product);
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
