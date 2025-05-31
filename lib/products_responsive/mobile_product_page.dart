import 'package:anubs_invoice_app/controller/add_item_controller.dart';
import 'package:anubs_invoice_app/routes/app_pages.dart';
import 'package:anubs_invoice_app/utiles/card_list.dart';
import 'package:anubs_invoice_app/utiles/my_add_item_button.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:anubs_invoice_app/utiles/my_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileProductPage extends StatelessWidget {
  const MobileProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addItemController = Get.find<AddItemController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: MyAppBar(
          title: "Products",
          action: [
            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child:
                      screenWidth < 380
                          ? MyAddItemButton(
                            width: 140,
                            label: "Add Product",
                            icon: Icons.add_circle_outline,
                            onPressed: () {
                              Get.offNamed(Routes.addProduct);
                            },
                          )
                          : MyAddItemButton(
                            label: "Add Product",
                            icon: Icons.add_circle_outline,
                            onPressed: () {
                              Get.offNamed(Routes.addProduct);
                            },
                          ),
                );
              },
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
            const  SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: addItemController.productList.length,
                  itemBuilder: (context, index) {
                    // final product = addItemController.productList[index];
                    return CardList(index: index);
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
