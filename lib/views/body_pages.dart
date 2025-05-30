import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anubs_invoice_app/controller/page_controller.dart';
import 'package:anubs_invoice_app/utiles/my_app_bar.dart';
import 'package:anubs_invoice_app/utiles/my_drawer.dart';

class BodyPages extends StatelessWidget {
  BodyPages({super.key});

  final pageController = Get.find<MyPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedIndex = pageController.selectedIndex.value;
      final screenWidth = MediaQuery.of(context).size.width;
      final isDesktop = screenWidth >= 1100;

      return WillPopScope(
        onWillPop: () async {
          if (selectedIndex != 0) {
            pageController.changeIndex(0);
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: _buildAppBar(isDesktop, selectedIndex),
          drawer: isDesktop ? null : MyDrawer(),
          onDrawerChanged: (isOpened) {
            if (isOpened) FocusManager.instance.primaryFocus?.unfocus();
          },
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: _buildBody(isDesktop, selectedIndex, pageController),
        ),
      );
    });
  }

  PreferredSizeWidget? _buildAppBar(bool isDesktop, int selectedIndex) {
    if (isDesktop || selectedIndex == 1) return null;

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Align(child: MyAppBar(title: 'AUNBS')),
    );
  }

  Widget _buildBody(
    bool isDesktop,
    int selectedIndex,
    MyPageController controller,
  ) {
    if (isDesktop) {
      return Row(
        children: [
          SizedBox(width: 250, child: MyDrawer()),
          const VerticalDivider(width: 0.5),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: controller.pages,
            ),
          ),
        ],
      );
    }

    return IndexedStack(index: selectedIndex, children: controller.pages);
  }
}
